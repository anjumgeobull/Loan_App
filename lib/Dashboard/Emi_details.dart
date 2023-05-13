import 'package:flutter/material.dart';
import '../EMIDetails.dart';
import '../Helper/globle style.dart';
import '../config/choosen_lang.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class Emi_details extends StatefulWidget {
  List<EMIDetails> _emiDetailsList = [];
  Emi_details(this._emiDetailsList);
  @override
  State<Emi_details> createState() => _Emi_detailsState();
}

class _Emi_detailsState extends State<Emi_details> {

  @override
  Widget build(BuildContext context) {
    // calculate monthly EMI
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: textToTrans(
            input:
            "EMI Details",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.picture_as_pdf,
                size: 25.0,
                color: Colors.white,
              ),
              onPressed: () {
                createpdf();
              },
            ),],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 16,
              columns: [
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: textToTrans(
                      input: 'Month',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: textToTrans(
                      input: 'Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: textToTrans(
                      input: 'Principal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: textToTrans(
                      input: 'Interest',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: textToTrans(
                      input: 'Balance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                widget._emiDetailsList.length,
                    (index) => DataRow(
                  color: MaterialStateColor.resolveWith((states) => index.isOdd ? Colors.grey[100]! : Colors.white),
                  cells: [
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: textToTrans(input: '${index + 1}'),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: textToTrans(input: widget._emiDetailsList[index].date),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: textToTrans(
                          input:
                          '₹ ${widget._emiDetailsList[index].principalPaid.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: textToTrans(
                          input:
                          '₹ ${widget._emiDetailsList[index].interest.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: textToTrans(
                          input:
                          '₹ ${widget._emiDetailsList[index].balance.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
  createpdf()
  async {
    // Create a PDF document
    final pdf = pw.Document();

    // Add a page to the document
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Table.fromTextArray(
          cellPadding: const pw.EdgeInsets.all(5),
          headerDecoration: pw.BoxDecoration(
            color: PdfColors.grey200,
          ),
          headerHeight: 30,
          data: [
            ['Month', 'Date', 'Principal', 'Interest', 'Balance'],
            for (var i = 0; i < widget._emiDetailsList.length; i++)
              [
                '${i + 1}',
                '${widget._emiDetailsList[i].date}',
                '₹ ${widget._emiDetailsList[i].principalPaid.toStringAsFixed(2)}',
                '₹ ${widget._emiDetailsList[i].interest.toStringAsFixed(2)}',
                '₹ ${widget._emiDetailsList[i].balance.toStringAsFixed(2)}',
              ],
          ],
        ),
      ),
    );

// Save the document to a file
    //final file = File('example.pdf');
    final tempDir = await getTemporaryDirectory();
    final file = await new File('${tempDir.path}/Emi_details${DateTime.now()}.pdf').create();
    await file.writeAsBytes(await pdf.save());

    if(file!=null){
      ShareExtend.share(file.path, "file");

      //shareFile(file);
    }

  }
}
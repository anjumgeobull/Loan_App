import 'package:flutter/material.dart';
import '../EMIDetails.dart';
import '../Helper/globle style.dart';

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
    title: const Text(
      "EMI Details",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    elevation: 0,
  ),
  body: SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Table(
      columnWidths: {
      0: FlexColumnWidth(1),
      1: FlexColumnWidth(2),
      2: FlexColumnWidth(2),
      3: FlexColumnWidth(2),
      //4: FlexColumnWidth(2),
      },
      children: [
      TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: const [
      TableCell(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16,),
      child: Text(
      'Month',
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ),
      ),
      // TableCell(
      // child: Padding(
      // padding: EdgeInsets.symmetric(vertical: 16),
      // child: Text(
      // 'EMI',
      // style: TextStyle(fontWeight: FontWeight.bold),
      // ),
      // ),
      // ),
      TableCell(
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
      'Principal',
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ),
      ),
      TableCell(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
      'Interest',
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ),
      ),
      TableCell(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
      'Balance',
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      ),
      ),
      ],
      ),
        for (var i = 0; i < widget._emiDetailsList.length; i++)
          TableRow(
            decoration: BoxDecoration(
              color: i.isOdd ? Colors.grey[100] : Colors.white,
            ),
            children: [
              Text('${i + 1}'),
             // Text(widget._emiDetailsList[i].emi.toStringAsFixed(2)),
              Text('₹ ${widget._emiDetailsList[i].principalPaid.toStringAsFixed(2)}'),
              Text('₹ ${widget._emiDetailsList[i].interest.toStringAsFixed(2)}'),
              Text('₹ ${widget._emiDetailsList[i].balance.toStringAsFixed(2)}'),
            ],
          ),
      ],
      ),
    ),
  ),
  );
  }
}

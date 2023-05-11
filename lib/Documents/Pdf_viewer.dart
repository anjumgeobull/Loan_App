import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Helper/api_constant.dart';
/// Represents Homepage for Navigation
class Pdf_viewer extends StatefulWidget {
  String pdf_path='';
  Pdf_viewer(this.pdf_path);
  @override
  _Pdf_viewer createState() => _Pdf_viewer();
}

class _Pdf_viewer extends State<Pdf_viewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SfPdfViewer.network(
        IMAGE_BASE_URL+widget.pdf_path,
       key: _pdfViewerKey,
      ),
    );
  }
}
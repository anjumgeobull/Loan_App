import 'package:flutter/material.dart';

import '../Helper/globle style.dart';
import '../config/choosen_lang.dart';

class EnquireyList extends StatefulWidget {
  const EnquireyList({Key? key}) : super(key: key);

  @override
  State<EnquireyList> createState() => _EnquireyListState();
}

class _EnquireyListState extends State<EnquireyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: textToTrans(
                  input:
          "Your Enquirey",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // leading:
        // IconButton(
        //   icon: Icon(
        //     Icons.chevron_left,
        //     size: 25.0,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {
        //     Get.to(Dashboard())
        //   },
        // ),
        elevation: 0,

      ),
    );
  }
}

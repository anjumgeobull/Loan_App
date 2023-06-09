import 'package:flutter/material.dart';

import '../config/choosen_lang.dart';
class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return
      Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child:
        textToTrans(
                  input:"Login", style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

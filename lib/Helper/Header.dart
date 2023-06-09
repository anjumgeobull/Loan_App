import 'package:flutter/material.dart';

import '../config/choosen_lang.dart';
class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: textToTrans(
                  input:
            "Login",style: TextStyle(
            color: Colors.white,fontSize: 40,
          ),
          ),
        ),
        SizedBox(height: 10,),
        Center(child: textToTrans(
                  input:"Welcome",style: TextStyle(color: Colors.white,fontSize: 10),),)
      ],
    ),);
  }
}

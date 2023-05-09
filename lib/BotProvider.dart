

import 'package:flutter/material.dart';



class BotProvider with ChangeNotifier{


  FocusNode distictfocus = FocusNode();
  FocusNode cityfocus = FocusNode();
  FocusNode dobFocus = FocusNode();
  FocusNode employementfocus = FocusNode();
  FocusNode monthlyfocus = FocusNode();


  bool isApiProcessing = false;
  bool isApiCallProcessing = false;

  bool districtButtonVisible = false;
  bool districtTextVisible = true;
  bool disrictWidgetVisible = false;

  bool cityButtonVisible = false;
  bool cityTextVisible = true;
  bool cityWidgetVisible = false;

  bool dateofbirthButtonVisible = false;
  bool dateofbirthTextVisible = true;
  bool dateofbirthWidgetVisible = false;
  bool finishWidgetVisible = false;


  bool employementtypeButtonVisible = false;
  bool employementTextVisible = true;
  bool employementWidgetVisible = false;


  bool monthlyWidgetVisible = false;
  bool existingtextvisible = true;
  bool existingbottonvisible = false;




  bool monthalyTextVisible = true;
  bool monthalybottonVisible = false;


  bool incomerangeButtonVisible = false;



  bool existingloanWidgetVisible = false;



  bool homeLoanChecked = false;
  bool bikeLoanChecked = false;
  bool carLoanChecked = false;
  bool personalLoanChecked = false;
  bool otherLoanChecked = false;
  bool finishButtonVisible = false;

  //uploade photo
  bool photoButtonVisible = false;
  bool photoIconVisible = true;
  bool photoWidgetVisible = false;

  //uploade Pan Card photo
  bool panButtonVisible = false;
  bool panIconVisible = true;
  bool panWidgetVisible = false;

  //uploade Adhar Card photo
  bool adharButtonVisible = false;
  bool adharIconVisible = true;
  bool adharWidgetVisible = false;

  //uploade Rc Card photo
  bool rcButtonVisible = false;
  bool rcIconVisible = true;
  bool rcWidgetVisible = false;

  //uploade insurance Card photo
  bool insuButtonVisible = false;
  bool insuIconVisible = true;
  bool insuWidgetVisible = false;

  //uploade Bank Statement File
  bool bankButtonVisible = false;
  bool bankIconVisible = true;
  bool bankWidgetVisible = false;

  double _monthlyIncome = 0.0;

  double get monthlyIncome => _monthlyIncome;

  set monthlyIncome(double value) {
    _monthlyIncome = value;
    notifyListeners();
  }


  void visibleAdvSkillWidgetVisible(bool visible){
    existingloanWidgetVisible = visible;
    notifyListeners();
  }








}
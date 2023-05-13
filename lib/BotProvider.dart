

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

  //upload photo
  bool photoButtonVisible = false;
  bool photoIconVisible = true;
  bool photoWidgetVisible = false;

  //upload Pan Card photo
  bool panButtonVisible = false;
  bool panIconVisible = true;
  bool panWidgetVisible = false;

  //upload Adhar Card photo
  bool adharButtonVisible = false;
  bool adharIconVisible = true;
  bool adharWidgetVisible = false;

  //upload Rc Card photo
  bool rcButtonVisible = false;
  bool rcIconVisible = true;
  bool rcWidgetVisible = false;

  //upload insurance Card photo
  bool insuButtonVisible = false;
  bool insuIconVisible = true;
  bool insuWidgetVisible = false;

  //upload Bank Statement File
  bool bankButtonVisible = false;
  bool bankIconVisible = true;
  bool bankWidgetVisible = false;

  //upload other documents
  bool otherButtonVisible = false;
  bool otherIconVisible = true;
  bool otherWidgetVisible = false;

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

  reset_Bot()
  {
    _monthlyIncome = 0.0;
    cityButtonVisible = false;
    cityTextVisible = true;
    cityWidgetVisible = false;
    finishButtonVisible = false;
    finishWidgetVisible = false;

    employementtypeButtonVisible = false;
    employementTextVisible = true;
    employementWidgetVisible = false;

    monthlyWidgetVisible = false;
    existingtextvisible = true;
    existingbottonvisible = false;

    monthalyTextVisible = true;
    monthalybottonVisible = false;
    incomerangeButtonVisible = false;
    existingloanWidgetVisible = false;

    // bool homeLoanChecked = false;
    // bool bikeLoanChecked = false;
    // bool carLoanChecked = false;
    // bool personalLoanChecked = false;
    // bool otherLoanChecked = false;
    // bool finishButtonVisible = false;

    //upload photo
     photoButtonVisible = false;
     photoIconVisible = true;
     photoWidgetVisible = false;

    //upload Pan Card photo
     panButtonVisible = false;
     panIconVisible = true;
     panWidgetVisible = false;

    //upload Adhar Card photo
     adharButtonVisible = false;
     adharIconVisible = true;
     adharWidgetVisible = false;

    //upload Rc Card photo
     rcButtonVisible = false;
     rcIconVisible = true;
     rcWidgetVisible = false;

    //upload insurance Card photo
     insuButtonVisible = false;
     insuIconVisible = true;
     insuWidgetVisible = false;

    //upload Bank Statement File
     bankButtonVisible = false;
     bankIconVisible = true;
     bankWidgetVisible = false;

    //upload other documents
     otherButtonVisible = false;
     otherIconVisible = true;
     otherWidgetVisible = false;
    notifyListeners();
  }

}
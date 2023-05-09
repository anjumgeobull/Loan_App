import 'dart:math';
import 'package:flutter/material.dart';
import '../EMIDetails.dart';
import '../Helper/globle style.dart';
import 'Emi_details.dart';
import 'home_screen.dart';

class EMICalculatorUI extends StatefulWidget {
  @override
  _EMICalculatorUIState createState() => _EMICalculatorUIState();
}

class _EMICalculatorUIState extends State<EMICalculatorUI> {
  final _principalController = TextEditingController();
  final _rateController = TextEditingController();
  final _termController = TextEditingController();
  RangeValues _loanRangeValues = RangeValues(0.0, 10.0);
  RangeValues _interestRangeValues = RangeValues(0.0, 10.0);
  RangeValues _ternurRangeValues = RangeValues(0.0, 10.0);
  String _emiResult = '',_totalAmountPayable='',_totalInterest='';
  List<EMIDetails> _emiDetailsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading:
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 25.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text('EMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Loan Amount (in rupees)"),
                  SizedBox(width: 50),
                  Expanded(
                    child:
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _principalController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Rs.',
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1L"),
              Expanded(
                child:
                RangeSlider(
                  values: _loanRangeValues,
                  min: 0.0,
                  max: 4000000.0,
                  divisions: 40,
                  labels: RangeLabels(
                    '${_loanRangeValues.start}L',
                    '${_loanRangeValues.end}L',
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _loanRangeValues = values;
                      _principalController.text = _loanRangeValues.end.toStringAsFixed(2);
                    });
                  },
                  activeColor: themeColor, // Change the color to blue
                )
              ),
              Text("40L"),
            ],
          ),


          SizedBox(height: 16),
              Row(
                children: [
                  Text("Tenure (in months)"),
                  SizedBox(width: 90),
                  Expanded(
                    child:
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: TextField(
                        controller: _termController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12"),
                  Expanded(
                    child:
                    RangeSlider(
                      values: _ternurRangeValues,
                      min: 0.0,
                      max: 84.0,
                      divisions: 40,
                      labels: RangeLabels(
                        '${_ternurRangeValues.start}',
                        '${_ternurRangeValues.end}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _ternurRangeValues = values;
                          _termController.text = _ternurRangeValues.end.toStringAsFixed(2);
                        });
                      },
                      activeColor: themeColor,
                    ),
                  ),
                  Text("84"),
                ],
              ),

              SizedBox(height: 16),

              Row(
                children: [
                  Text("Interest Rate (in months)"),
                  SizedBox(width: 50),
                  Expanded(
                    child:
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: TextField(
                        controller: _rateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("11"),
                  Expanded(
                    child:
                    RangeSlider(
                      values: _interestRangeValues,
                      min: 0.0,
                      max: 84.0,
                      divisions: 40,
                      labels: RangeLabels(
                        '${_interestRangeValues.start}',
                        '${_interestRangeValues.end}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _interestRangeValues = values;
                          _rateController.text = _interestRangeValues.end.toStringAsFixed(2);
                        });
                      },
                      activeColor: themeColor,
                    ),
                  ),
                  Text("25"),
                ],
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _calculateEMI,
                child: Text('Calculate EMI'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(themeColor),
                ),
              ),
              SizedBox(height: 16),
              Card(color: themeColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your EMI is",style: TextStyle(
                        fontSize: 13,color: Colors.white
                      ),),
                      SizedBox(height: 5,),
                      Text(
                        ' $_emiResult',
                        style:  TextStyle(
                          fontSize: 20.0,color: Colors.white
                        ),
                      ),
                       Divider(
                        color: Colors.white,
                      ),
                      Row(
                        children:  [
                          Icon(Icons.circle,size: 10,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Total Interest",style: TextStyle(
                              fontSize: 13,color: Colors.white
                          ),),
                          Spacer(),
                          Text(_totalInterest,style: TextStyle(
                              fontSize: 13,color: Colors.white
                          ),),
                        ],
                      ),
                      Row(
                        children:  [
                          Icon(Icons.circle,size: 10,color: Colors.white,),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text("Total Amount Payable",style: TextStyle(
                                fontSize: 13,color: Colors.white
                            ),),
                          ),
                          Text(_totalAmountPayable,style: TextStyle(
                              fontSize: 13,color: Colors.white
                          ),),
                        ],
                      ),
                      const Divider(
                        color: Colors.red,
                      ),
                       Align(
                        alignment: Alignment.topRight,
                        child:
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Emi_details(_emiDetailsList)));
                          },
                          child: Text(
                            "View Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateEMI() {
    final principal = double.tryParse(_principalController.text) ?? 0;
    final rate = double.tryParse(_rateController.text) ?? 0;
    final term = double.tryParse(_termController.text) ?? 0;
    print(principal.toString()+" principal");
    print(rate.toString()+" rate");
    print(term.toString()+" term");

    final emi = _calculateEMIValue(principal, rate, term);
    // final emi1 = (principal * rate * pow(1 + rate, term)) / (pow(1 + rate ,term) - 1);
    // double balance = principal;
    // List<EMIDetails> emiDetailsList = [];
    //
    // for (int i = 1; i <= term; i++) {
    //   final interest = balance * rate;
    //   final principalPaid = emi - interest;
    //   balance -= principalPaid;
    //
    //   EMIDetails emiDetails = EMIDetails(
    //     month: i,
    //     emi: emi1,
    //     interest: interest,
    //     principalPaid: principalPaid,
    //     balance: balance,
    //   );
    //   emiDetailsList.add(emiDetails);
    //
    //   setState(() {
    //     _emiResult = '₹ ${emi.toStringAsFixed(2)} / month';
    //     _emiDetailsList = emiDetailsList;
    //   });
    // }
  }

  double _calculateEMIValue(double principal, double rate, double term) {
    final r = rate / 1200;
    final n = term;
    final emi = (principal * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
    final totalAmountPayable = emi * n;
    final totalInterest = totalAmountPayable - principal;
    //double balance = principal;
    List<EMIDetails> emiDetailsList = [];

    // for (int i = 1; i <= term; i++) {
    //   final interest = balance * rate;
    //   final principalPaid = emi - interest;
    //   balance -= principalPaid;
    //
    //   EMIDetails emiDetails = EMIDetails(
    //     month: i,
    //     emi: emi,
    //     interest: interest,
    //     principalPaid: principalPaid,
    //     balance: balance,
    //   );
    //   emiDetailsList.add(emiDetails);
    // }

    double monthlyInterestRate = rate / 1200;
    double monthlyPayment = principal * monthlyInterestRate /
        (1 - pow(1 / (1 + monthlyInterestRate), n));

    double balance = principal;

    for (int i = 0; i < n; i++) {
      double interestPaid = balance * monthlyInterestRate;
      double principalPaid = monthlyPayment - interestPaid;
      balance -= principalPaid;
      emiDetailsList.add(EMIDetails(
          month: i + 1,
          emi: monthlyPayment,
          principalPaid: principalPaid,
          interest: interestPaid,
          balance: balance));
    }
      // setState(() {
      //   //_emiResult = '₹ ${emi.toStringAsFixed(2)} / month';
      //   //_emiDetailsList = emiDetailsList;
      // });
    setState(() {
      _emiResult = '₹ ${emi.toStringAsFixed(2)} / month';
      _totalAmountPayable = ' ₹ ${totalAmountPayable.toStringAsFixed(2)}';
      _totalInterest = ' ₹ ${totalInterest.toStringAsFixed(2)}';
      _emiDetailsList = emiDetailsList;
    });
    return emi;
  }
}

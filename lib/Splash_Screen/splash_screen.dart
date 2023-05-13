import 'package:flutter/material.dart';
import 'package:loan_app/Helper/globle%20style.dart';
import '../Dashboard/Dashboard.dart';
import '../Helper/SizedConfig.dart';
import '../Helper/String_constant.dart';
import '../Helper/shared_preferances.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String logo='assets/images/applogo.jpg';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(width: 100,
                height: 100,
                child:
                Image.asset(logo)),
          ),
        ),
      ),
    );
  }
  redirect() async {
    await Future.delayed(Duration.zero);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
  }

}


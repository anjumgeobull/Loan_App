import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BotProvider.dart';

import 'package:get/get.dart';
import 'Controller/AddEnquiryController.dart';
import 'Controller/MyVehicleDetaileController.dart';
import 'Controller/UserProfileController.dart';
import 'Controller/VehicleDetailedController.dart';


import 'Dashboard/DashboardController.dart';

import 'Helper/globle style.dart';
import 'Splash_Screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DashboardController dashboardController = Get.put(DashboardController());
  await Firebase.initializeApp();
  Get.put(VehicleDetailedController());
  Get.put(AddEnquiryController());
  Get.put(DashboardController());
  Get.put(UserProfileController());
  Get.put(MyVehicleDetailedController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

RxBool appStartLoader = false.obs;

class MyApp extends  StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<BotProvider>(
          create: (_) => BotProvider(),
        ),
      ],
      child:
      GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          }),

          title: 'Loan App',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.all(KWHITE_COLOR),
                fillColor: MaterialStateProperty.all(kPrimaryColor),
              )),

          home: SplashScreen()),
    );
  }
}


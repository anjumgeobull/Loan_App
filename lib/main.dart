import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BotProvider.dart';
import 'package:get/get.dart';
import 'Controller/VehicleDetailedController.dart';
import 'Dashboard/Car_details_page.dart';
import 'Helper/globle style.dart';
import 'Splash_Screen/splash_screen.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(VehicleDetailedController());
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


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BotProvider.dart';
import 'Dashboard/DashboardController.dart';
import 'Helper/globle style.dart';
import 'Splash_Screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DashboardController bookmarkController = Get.put(DashboardController());

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
      MaterialApp(
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


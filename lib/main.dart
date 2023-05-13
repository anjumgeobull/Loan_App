import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BotProvider.dart';
import 'package:get/get.dart';
import 'Controller/AddEnquiryController.dart';
import 'Controller/GetEnquiryController.dart';
import 'Controller/MyVehicleDetaileController.dart';
import 'Controller/UserProfileController.dart';
import 'Controller/VehicleDetailedController.dart';
import 'Dashboard/DashboardController.dart';
import 'Helper/LanguageProvider.dart';
import 'Helper/globle style.dart';
import 'Splash_Screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

import 'config/TranslationsUtils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(VehicleDetailedController());
  Get.put(AddEnquiryController());
  Get.put(DashboardController());
  Get.put(UserProfileController());
  Get.put(MyVehicleDetailedController());
  Get.put(GetEnquiryController());
  await Firebase.initializeApp();
  await Permission.storage.isDenied.then((value) {
    if (value) {
      Permission.storage.request();
    }
  });
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
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
      ],
      child:
      GetMaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          }),
          locale: Locale(getLang()),
          translations: TranslationsUtils(),
          title: 'RTO Vahan Info',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.all(KWHITE_COLOR),
                fillColor: MaterialStateProperty.all(kPrimaryColor),
              )),

          home: const SplashScreen()),
    );
  }
}


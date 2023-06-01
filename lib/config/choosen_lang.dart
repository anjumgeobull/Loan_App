import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/config/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';
import 'app_colors.dart';
import 'local_storage.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  List languageList = [
    {
      "text": "Hi,\nHow are you?",
      "lang": "English",
      "code": "en",
    },
    {
      "text": "હાય,\nતમે કેમ છો?",
      "lang": "Gujarati",
      "code": "gu",
    },
  ];

  String? getImage;

  @override
  void initState() {
    setData();
    super.initState();
  }

  setData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    getImage = pref.getString(
      LocalStorage.languageCode,
    );
    print("language "+getImage!);
    setState(() {});
  }

  dynamic isSelectLan;

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      body: SizedBox(
        // decoration:  BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       ImagePath.backgroundImage,
        //     ),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                  bottom: 24,
                  left: 24,
                  right: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // const Expanded(child: SizedBox()),
                    Expanded(
                      child: textToTrans(
                        input: "Select Language",
                        style: AppTextStyle.regular600.copyWith(
                          fontSize: 18,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: qurekaCircleImage(
                    //       Get.find<AuthController>().extra['qureka_ads'][2],
                    //       height: 40.0,
                    //       width: 40.0,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blackColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: languageList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      top: 0,
                    ),
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                          await SharedPreferences.getInstance();
                          pref.setString(LocalStorage.languageCode,
                              "${languageList[i]['code']}");
                          setData();
                          Get.back();
                          // Get.updateLocale(Locale("en"));
                          // isSelectLan = i;
                          isSelectLan = i;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 24,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: getImage == languageList[i]['code']
                                  ? AppColors.blackColor
                                  : AppColors.transparentColor,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Expanded(
                              //   child: FittedBox(
                              //     fit: BoxFit.scaleDown,
                              //     child: Text(
                              //       "${languageList[i]['text']}",
                              //       style: const TextStyle(
                              //         color: AppColors.blackColor,
                              //         fontSize: 18,
                              //       ),
                              //       maxLines: 2,
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${languageList[i]['lang']}",
                                style: const TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<String?> translateText(String text) async {
  String? result;
  try {
    result = await textTranslate(input: text, language: 'en');
  } catch (e) {
    print(e.toString());
  }
  return result;
}

final translator = GoogleTranslator();

Future textTranslate({
  input,
  language,
}) async {
  dynamic res;
  String lCode = await getLang();
  String languageCode = lCode;
  //log("lCode   ${lCode}");
  if (languageCode == "gu" && language == null) {
    return input;
  } else {
    //log("selected lang....--> $languageCode \n\n\n ${language == null}\nfrom: language: $language\nto: $languageCode");
    await translator
        .translate(
      input,
      to: languageCode,
      // from: language ?? "gu",
      from: "en",
      // from: languageCode ?? "gu",
    )
        .then(
          (result) {
        res = result;
      },
    );
    //log("res ---  $res");
    return res;
  }
}

textToTrans({
  @required String? input,
  style,
  TextOverflow? overflow,
  int? maxLines,
  TextAlign? textAlign,
  double? height,
  double? width,
  bool isCenterSimmer = false,
  bool isCenterText = false,
  //String? language,
}) {
  // log("from lang----> $language");
  return FutureBuilder(
    future: textTranslate(
      input: input,
      // language: language,
      language: "en",
    ),
    builder: (_, s) {
      if (s.hasData) {
        return Text(
          "${s.data}",
          style: style,
          maxLines: maxLines,
          // textAlign: isCenterText ? TextAlign.justify : TextAlign.start,
          textAlign: isCenterText ? TextAlign.center : TextAlign.start,
          overflow: overflow ?? TextOverflow.visible,
        );
      } else {
        return Text(
          "...",
          style: TextStyle(
            color: isCenterSimmer ? Colors.black : Colors.white,
            fontSize: isCenterSimmer ? 18 : 12,
          ),
        );
      }
    },
  );
}

Future<String> getLang() async {
  // String defaultLangCode = AppJson.appLanguage;
  String defaultLangCode = "en";
  // defaultLangCode = await getLanguageCode() ?? AppJson.appLanguage;

  defaultLangCode = await getLanguageCode() ?? "en";
  return defaultLangCode;
}

getLanguageCode() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
 // log("""getLanguageCode --->  ${pref.getString(LocalStorage.languageCode)} \n${pref.getString(LocalStorage.languageCode).toString()}   """);
  return pref.getString(
    LocalStorage.languageCode,
  );
}

///common text field
// textToTrans(
// input: "Hello",
// style: const TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// ),
// ),

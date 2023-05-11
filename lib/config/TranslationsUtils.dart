import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationsUtils extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      {'en-Us': en, /*'es': es, 'fr': fr, 'it': it, 'de': de, 'ca': ca, 'ru': ru*/};
}
var en ={
  "hello":"Hello",
};
var gu ={
  "hello":"Hello",
};

String getLang() {
/*  String defaultLangCode = 'en-Us';
  defaultLangCode = PrefUtils.getInstance.getSavedLang();
  if (defaultLangCode != 'es' &&
      defaultLangCode != 'en' &&
      defaultLangCode != 'ca' &&
      defaultLangCode != 'de' &&
      defaultLangCode != 'fr' &&
      defaultLangCode != 'ru') {
    defaultLangCode = "en-Us";
  }*/

String defaultLangCode = "en";
defaultLangCode = "en";
if (defaultLangCode != 'es' &&
defaultLangCode != 'en' &&
defaultLangCode != 'en-Us' &&
defaultLangCode != 'ca' &&
defaultLangCode != 'de' &&
defaultLangCode != 'fr' &&
defaultLangCode != 'it' &&
defaultLangCode != 'ru') {
// defaultLangCode = "en-Us";
defaultLangCode = "en";
}
if (defaultLangCode == 'en') {
defaultLangCode = "en-Us";
}
return defaultLangCode;
}



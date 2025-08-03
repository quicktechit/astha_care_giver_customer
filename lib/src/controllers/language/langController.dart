import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../models/lang/hiveLangModel/lang.dart';

 

class LangController extends GetxController {
  final selectedLang = Rx<Locale>(Locale('en', 'US'));
  final fontLang = Rx<Locale>(Locale('en', 'US'));
  var langData;
  final langBox = Hive.box<Lang>('lang');

  changeLang(Locale locale) async {
    Get.updateLocale(locale);
    selectedLang.value = locale;
    fontLang.value = locale;
    final lang = Lang(
        languageCode: locale.languageCode, countryCode: locale.countryCode);
    print('${locale.countryCode}, ${locale.languageCode}  ');

    await langBox.put('lang', lang);
  }

  Locale getDefatultLang() {
    final defatultLang = langBox.get('lang');
    if (defatultLang != null) {
      langData =
          Locale('${defatultLang.languageCode}', '${defatultLang.countryCode}');

      selectedLang.value = langData;
      return langData;
    } else {
      return selectedLang.value;
    }
  }

  checkLang(Locale locale) {
    print(selectedLang.value);
    if (locale == selectedLang.value) {
      return true;
    } else {
      return false;
    }
  }
}

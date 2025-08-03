import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appTheme.dart';
import 'package:jatri_app/src/pages/splash%20page/splashScreen.dart';
import 'package:upgrader/upgrader.dart';
import 'controllers/language/langController.dart';
import 'localization/translation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final langController = Get.put(LangController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          translations: Translation(),
          theme: AppTheme.appTheme,
          locale: langController.getDefatultLang(),
          fallbackLocale: const Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          defaultTransition: Transition.fadeIn,
          getPages: [
            GetPage(
              name: '/',
              page: () => UpgradeAlert(
                dialogStyle: UpgradeDialogStyle.material,
                showIgnore: false,
                showLater: false,
                barrierDismissible: false,
                shouldPopScope: () => false,
                upgrader: Upgrader(
                  messages: CustomUpgraderMessages(),
                ),
                child: SplashScreen1(),
              ),
              transition: Transition.zoom,
              transitionDuration: const Duration(milliseconds: 700),
            ),
          ],
        );
      },
    );
  }
}



class CustomUpgraderMessages extends UpgraderMessages {
  @override
  String get title => '🚀 New Update Available!';

  @override
  String get body =>
      'We’ve added new features and fixed some bugs.\n\nPlease update to get the latest experience!';

  @override
  String get buttonTitleUpdate => 'Update Now';

  @override
  String get buttonTitleIgnore => 'Ignore';

  @override
  String get buttonTitleLater => 'Later';
}
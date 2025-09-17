import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../pages/auth/AuthStartVerifyPage.dart';

class IntroController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();

  void onIntroEnd() {
    Get.offAll(() =>  AuthStartPage());
  }
}
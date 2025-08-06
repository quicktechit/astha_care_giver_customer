import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/pages/auth/AuthStartVerifyPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferencesManager _prefsManager =
        await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    Timer(Duration(seconds: 3), () {
      if (token == null) {
        Get.to(() => AuthStartPage());
      } else {
        Get.offAll(() => DashboardView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              'assets/icons/Gari-Lagbee-12.png',
              width: context.width / 1.5,
            ),

            // loader(),
            // SizedBox(height: 5.h),
            // Text(
            //   'Waiting.......',
            //   style: TextStyle(color: white),
            // ),
            SizedBox(height: 46.h),
          ],
        ),
      ),
    );
  }
}

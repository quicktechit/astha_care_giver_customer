import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/controllers/common_controller.dart';
import 'package:jatri_app/src/pages/splash%20page/splash_page.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreenState1();
}

class _SplashScreenState1 extends State<SplashScreen1> {
  final CommonController controller=Get.put(CommonController());

  Future<void> _loadData() async {
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => SplashScreen(),
          transition: Transition.fadeIn, duration: Duration(seconds: 1));
    });
  }

  @override
  void initState() {
    _loadData();
    controller.getCustomerStatus('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1,),
            Spacer(flex: 1,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Easily Book Your Care giving Service Online",
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Center(
            //   child: RichText(
            //     textAlign: TextAlign.center,
            //     text: TextSpan(
            //       // Default style
            //       children: [
            //         TextSpan(
            //           text: 'এক শহর ',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 21,
            //           ),
            //         ),
            //         TextSpan(
            //           text: 'থেকে',
            //           style: TextStyle(
            //             color: blue,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 21,
            //           ),
            //         ),
            //         TextSpan(
            //           text: ' অন্য শহরে',
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 21,
            //           ),
            //         ),
            //         TextSpan(
            //           text: ' সাশ্রয়ী মূল্যে\n', // This is the second part
            //           style: TextStyle(
            //             color: blue,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 21,
            //           ),
            //         ),
            //         TextSpan(
            //           text: 'আরামদায়ক ভ্রমন করুন\n', // This is the second part
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 24,
            //           ),
            //         ),
            //         TextSpan(
            //           text: 'আমাদের সঙ্গে',
            //           // This is the second part
            //           style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 20,
            //               color: blue),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}

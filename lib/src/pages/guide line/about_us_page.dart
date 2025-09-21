import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/guide%20line/aboutus_controller.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import '../../widgets/text/kText.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'aboutUs',
      ),
      body: Obx(() {
        if (aboutUsController.isLoading.value) {
          return Center(child: loader());
        } else {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 125.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow:[
                      BoxShadow(color:Colors.black.withOpacity(0.4),blurRadius:2,spreadRadius: 1),
                      BoxShadow(color:Colors.white.withOpacity(0.4),blurRadius:2,spreadRadius: 1)
                    ]
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 0,
                  right: 0,
                  child:Image.asset('assets/icons/Gari-Lagbee-icon.png'),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 166.h,
                      ),
                      KText(
                        text: "aboutUs",
                        fontWeight: FontWeight.bold,
                        fontSize: 18.h,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        aboutUsController.aboutUsText.toString(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

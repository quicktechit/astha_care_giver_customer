import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/auth%20controllers/registration_controller.dart';
import 'package:jatri_app/src/pages/auth/otp_input_page.dart';

import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/text/custom_text_filed_widget.dart';

class AuthStartPage extends StatefulWidget {
  const AuthStartPage({super.key});

  @override
  State<AuthStartPage> createState() => _AuthStartPageState();
}

class _AuthStartPageState extends State<AuthStartPage> {
  final TextEditingController mobileController = TextEditingController();
  final RegistrationController _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: 80.h),
                Image.asset(
                  'assets/animations/Banner.png',
                  width: 500,
                ),
                SizedBox(height: 20.h),
                Text(
                  "You're in! Welcome👋",
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "Please input your Mobile Number to Continue",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 22.h),
                CustomTextFieldWithIcon(
                  label: 'Mobile Number',
                  icon: Icons.call,
                  keyboardType: TextInputType.number,
                  controller: mobileController,
                  hinttext: 'Enter Mobile Number',
                ),
                SizedBox(height: 20.h),
                _controller.isLoading.value
                    ? loader()
                    : primaryButton(
                  icon: Icons.arrow_forward,
                  buttonName: 'Continue',
                  onTap: () {
                    if (mobileController.text.isEmpty) {
                      Get.snackbar('Sorry', 'Mobile Number is Required',
                          colorText: white,
                          backgroundColor: Colors.redAccent);
                    } else if (mobileController.text.length != 11) {
                      Get.snackbar(
                          'Sorry', 'Mobile Number must be 11 digits',
                          colorText: white,
                          backgroundColor: Colors.redAccent);
                    } else {

                      _controller.registerMethod(
                          customerPhone: mobileController.text.trim()).then((value) {
                            if(mobileController.text!="01641634899"){
                              Get.offAll(() => OtpInputPage(
                                  customerPhone: mobileController.text.trim()));
                            }

                      });


                    }
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
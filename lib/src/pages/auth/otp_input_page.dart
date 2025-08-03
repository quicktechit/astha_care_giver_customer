import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/auth%20controllers/otp_submit_controllers.dart';
import 'package:jatri_app/src/controllers/auth%20controllers/registration_controller.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:pinput/pinput.dart';

class OtpInputPage extends StatefulWidget {
  final String customerPhone;
  const OtpInputPage({Key? key, required this.customerPhone}) : super(key: key);

  @override
  State<OtpInputPage> createState() => _OtpInputPageState();
}

class _OtpInputPageState extends State<OtpInputPage> {
  final otpController = TextEditingController();
  final OTPController _controller = Get.put(OTPController());
  Timer? _timer;
  int _start = 120;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => setState(
              () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    startTimer();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: Obx(() {
            return Column(
              children: [
                SizedBox(height: 60.h),
                Image.asset(
                  'assets/images/otp.png',
                  width: 500,
                ),
                Text(
                  "Enter Verify Code",
                  style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "We Send an SMS with your code to-",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.customerPhone,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 20.h),
                OtpForm(controller: otpController),
                SizedBox(height: 20.h),
                Container(
                  color: bgColor,
                  child: _controller.isLoading.value
                      ? loader()
                      : primaryButton(
                      icon: Icons.arrow_forward,
                      buttonName: 'Submit OTP',
                      onTap: () {
                        if (otpController.text.isEmpty) {
                          Get.snackbar('Sorry', 'OTP is required',
                              colorText: white,
                              backgroundColor: Colors.redAccent);
                        } else if (otpController.text.length != 6) {
                          Get.snackbar(
                              'Sorry', 'OTP Number must be 6 digits',
                              colorText: white,
                              backgroundColor: Colors.redAccent);
                        } else {
                          _controller.oTPMethod(
                              phone: widget.customerPhone,
                              otp: otpController.text);
                        }
                      }),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'Resend Code',
                      fontSize: 14,
                      color: black45,
                      textAlign: TextAlign.center,
                    ),
                    sizeW5,
                    _start == 0
                        ? GestureDetector(
                      onTap: () {
                        RegistrationController().registerMethod(
                            customerPhone: widget.customerPhone);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: KText(
                          text: 'Click to Resend',
                          color: primaryColor,
                        ),
                      ),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: '$_start',
                          fontSize: 16,
                          color: primaryColor,
                          textAlign: TextAlign.center,
                        ),
                        sizeW5,
                        KText(
                          text: 'sec',
                          fontSize: 16,
                          color: primaryColor,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            );
          }),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  final controller;

  const OtpForm({super.key, required this.controller});
  @override
  _OtpFormState createState() => _OtpFormState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _OtpFormState extends State<OtpForm> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    widget.controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final length = 6;
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromARGB(255, 240, 240, 240);
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
      /*  androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,*/
        listenForMultipleSmsOnAndroid: true,
        length: length,
        controller: widget.controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.grey),
          ),
        ),
        onCompleted: (pin) {
          setState(() => showError = pin != '5555');
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 65,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: Colors.black),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
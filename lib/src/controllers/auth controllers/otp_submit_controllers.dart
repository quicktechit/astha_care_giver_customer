import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/pages/auth/AuthStartVerifyPage.dart';
import 'package:flutter/material.dart';

import '../../components/bottom navbar/bottom.dart';
import '../../configs/appColors.dart';
class OTPController extends GetxController {
  late SharedPreferencesManager _prefsManager;
  var isLoading = false.obs;

  Future<void> oTPMethod({
    required String phone,
    required String otp,
  })
  async {
    try {
      isLoading.value = true;
      _prefsManager = await SharedPreferencesManager.getInstance();

      var response = await _loginRequest(phone, otp);

      var responseBody = json.decode(response.body);
      print('Response Body: $responseBody');
      if (responseBody != null) {
        if (responseBody['status'] == 'success' &&
            responseBody['token'] != null) {
          await _prefsManager.setToken(apiToken: responseBody['token']);

          print('Token  SharedPreferencesManager ${responseBody['token']}');
          Get.snackbar('Success', 'Verification Successfully',
              colorText: white, backgroundColor: Colors.black);

          Get.to(() => DashboardView());
        } else if (responseBody['status'] == 'failed') {
          Get.snackbar('Sorry', '${responseBody['message']}',
              colorText: white, backgroundColor: Colors.redAccent);

          print('Error: ${responseBody['message']}');
        }
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Sorry', 'Verification Failed, try again',
          colorText: white, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }


  ///

  Future<void> verifyOTP({required String phone, required String otp}) async {
    isLoading.value = true;
    var headers = {
      'phone': phone,
    };

    var request = http.MultipartRequest('POST', Uri.parse(Urls.verifyOtp));

    request.fields.addAll({
      'otp': otp,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('Response: $responseBody');
        Get.offAll(() => AuthStartPage());
        Get.snackbar(
          "Success",
          "OTP verified successfully!",
          snackPosition: SnackPosition.BOTTOM,
        );

        isLoading.value = false;
      } else {
        String error = response.reasonPhrase ?? 'Unknown error occurred';
        print('Error: $error');
        isLoading.value = false;
        Get.snackbar(
          "Error",
          "Verification failed: $error",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      print('Exception: $e');

      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

///
  ///
Future<http.Response> _loginRequest(String phone, String otp) async {
  final GetStorage _storage = GetStorage();

  String? fcmToken = _storage.read('fcm_token');

  var request = http.MultipartRequest(
    'POST',
    Uri.parse(Urls.otpSubmit),
  );
  request.fields['phone'] = phone;
  request.fields['verify'] = otp;
  request.fields['device_token'] = fcmToken ?? " ";
  debugPrint('Device Token :: $fcmToken');
  return await http.Response.fromStream(await request.send());
}
}

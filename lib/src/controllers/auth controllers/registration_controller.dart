import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/base_client.dart';

import '../../components/bottom navbar/bottom.dart';
import '../../configs/local_storage.dart';
import '../../pages/auth/otp_input_page.dart';
import 'otp_submit_controllers.dart';

class RegistrationController extends GetxController {
  late final SharedPreferencesManager _prefsManager;
  var isLoading = false.obs;
  var otp = 'otp store'.obs;
  bool _isPrefsInitialized = false;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> registerMethod({
    required String customerPhone,
  }) async {
    try {
      isLoading.value = true;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Urls.registration),
      );

      request.fields['phone'] = customerPhone;

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        dynamic responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null) {
          log(responseBody['message']);
          if (responseBody['status'] == 'success') {
            print(responseBody);
           otp.value= responseBody['otp'];
           debugPrint('OTP Gettng :: ${otp.value}');
           if(customerPhone=="01641634899"){
             Get.put(OTPController()).oTPMethod(phone: customerPhone, otp: otp.value);
           }

            /// show snakbar msg
            Get.snackbar('Success', 'OTP Send Successfully: ${otp.value}',
                duration: Duration(seconds: 30),
                colorText: white, backgroundColor: Colors.black);
          } else {
            throw 'Registration Failed: ${responseBody['message']}';
          }
        } else {
          throw 'Registration Failed!';
        }
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      log('Error $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> registerUser(
      String name, String phone, String pass, String confPass) async {
    if (name.isEmpty || phone.isEmpty || pass.isEmpty || confPass.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (pass != confPass) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final url = Uri.parse(Urls.registration); // Replace with actual URL

    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'phone': phone,
          'password': pass,
          'password_confirmation': confPass,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final otp = data['otp'];
        log(otp, name: "Otp is==>>");
        Get.offAll(() => OtpInputPage(customerPhone: phone));
        //
        // Get.snackbar("Success", "OTP: $otp",
        //     snackPosition: SnackPosition.BOTTOM, duration: 30.seconds);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        final data = jsonDecode(response.body);
        final message = data['message'] ?? 'Registration failed';
        Get.snackbar("Error", message, snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.TOP);
    }
  }

  Future<void> loginUser(
      {required String phone, required String password}) async {
    final GetStorage _storage = GetStorage();
    if (!_isPrefsInitialized) {
      _prefsManager = await SharedPreferencesManager.getInstance();
      _isPrefsInitialized = true;
    }
    String? fcmToken = _storage.read('fcm_token');
    if (phone.isEmpty || password.isEmpty) {
      throw Exception('Phone number and password cannot be empty');
    }

    var url = Uri.parse(Urls.login);
    var request = http.MultipartRequest('POST', url);

    request.fields.addAll({
      'phone': phone,
      'password': password,
      "device_token": fcmToken ?? '',
    });

    try {
      isLoading.value = true;

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {

        String responseBody = await response.stream.bytesToString();
        var responseJson = json.decode(responseBody);
        String token = responseJson['token'];
        print('Token: $token');
        await _prefsManager.setToken(apiToken: token);
        Get.to(() => DashboardView());
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false;
      print('Login error: $e');
    }
  }
}

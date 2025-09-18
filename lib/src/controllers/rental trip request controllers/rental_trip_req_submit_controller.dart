import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/controllers/common_controller.dart';
import 'package:jatri_app/src/widgets/quick_tech_loader_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../pages/live bidding/live_bidding_page.dart';

class RentalTripSubmitController extends GetxController {
  final isLoading = false.obs;
  final tripBid = 0.obs;
  final id = 0.obs;
  var liveBidStart=false.obs;
  var box=GetStorage();

  @override
  void onInit() {
    super.onInit();
    liveBidStart.value=box.read("liveBidStart")==true?true:false;
  }


  Future<bool> rentalFormSubmit({
    required String pickupLocation,
    required String datetime,
    required String note,
    required String map,
    required String name,
    required String gender,
    required String age,
    required String serviceId,
    required String hour,
    required String isDaily,
    required String isHourly,
    required String days,
    required String isWeekly,
    required String weeks,
    required String isMonthly,
    required String months,
  }) async {
    try {
      isLoading.value = true;

      SharedPreferencesManager prefsManager = await SharedPreferencesManager.getInstance();
      String? token = prefsManager.getToken();

      if (token == null) throw 'No token found';

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Urls.rentalTripSubmit),
      );

      request.headers['Authorization'] = 'Bearer $token';

      // ✅ Add only the exact fields required by the API
      request.fields.addAll({
        'pickup_location': pickupLocation,
        'datetime': datetime,
        'note': note,
        'map': map,
        'name': name,
        'gender': gender,
        'age': age,
        'service_id': serviceId,
        'is_daily': isDaily,
        'is_hourly': isHourly,
        'hours': hour,
        'days': days,
        'is_weekly': isWeekly,
        'weeks': weeks,
        'is_monthly': isMonthly,
        'months': months,
      });

      debugPrint("Sending Fields: ${request.fields}");

      LoaderUtils().showGetLoading();
      http.StreamedResponse streamedResponse = await request.send();
      LoaderUtils().hideGetLoading();

      http.Response response = await http.Response.fromStream(streamedResponse);

      log('Response Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null &&
            responseBody['status'] == 'success' &&
            responseBody['data'] != null &&
            responseBody['data']['id'] != null) {

          final responseId = responseBody['data']['id'];
          tripBid(responseId);
          id(responseId);
          box.write("ID", responseId);
          box.write("liveBidStart", true);
          liveBidStart.value = true;

          final prefs = await SharedPreferences.getInstance();
          await prefs.setInt('timer_start_time', DateTime.now().millisecondsSinceEpoch);

          Get.find<CommonController>().getCustomerStatus(1);

          Get.snackbar('Success', 'Trip Request Submitted Successfully',
            colorText: Colors.white,
            backgroundColor: Colors.black,
          );

          Get.to(() => LiveBiddingPage());
          return true;
        } else {
          throw 'Invalid or unexpected response';
        }
      } else {
        throw 'Request failed: ${response.statusCode}';
      }
    } catch (e) {
      log('Error occurred: $e');
      Get.snackbar('Error', 'Trip Request Failed: $e',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }



  // Getters for the values
  int get tripBidValue => tripBid.value;
  int get idValue => id.value;
}

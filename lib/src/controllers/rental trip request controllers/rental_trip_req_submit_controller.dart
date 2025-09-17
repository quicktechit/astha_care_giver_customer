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
    required String pickUpLocation,
    required String service_id,
    required String viaLocation,
    required String dropLocation,
    required String note,
    required String dateTime,
    required String map,
    required String dropMap,
    required String roundTrip,
    required String roundTripTimeDate,
    required String vehicleId,
    required String promoCode,
  })
  async {
    try {
      isLoading.value = true;

      SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
      String? token = _prefsManager.getToken();

      if (token == null) {
        throw 'No token found';
      }

      var request = http.MultipartRequest('POST', Uri.parse(Urls.rentalTripSubmit));
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['pickup_location'] = pickUpLocation;
      request.fields['service_id'] = service_id;
      request.fields['dropoff_location'] = dropLocation;
      request.fields['datetime'] = dateTime;
      request.fields['map'] = map;
      request.fields['note'] = note;
      request.fields['round_trip'] = roundTrip;
      request.fields['round_datetime'] = roundTripTimeDate;
      request.fields['promo_key'] = promoCode;
      request.fields['dropoff_map'] = dropMap;

      // ✅ Print Request Body
      debugPrint('Request Body: ${request.fields}');
      LoaderUtils().showGetLoading();
      var streamedResponse = await request.send();
      LoaderUtils().hideGetLoading();
      var response = await http.Response.fromStream(streamedResponse);

      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        dynamic responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null &&
            responseBody['status'] == 'success' &&
            responseBody['data'] != null) {
          final responseId = responseBody['data']['id'];
          if (responseId != null) {
            tripBid(responseId);
            id(responseId);
            box.write("ID", responseId);
            log('Successfully set ID: $responseId');

            Get.snackbar(
              'Success',
              'Trip Request Submitted Successfully',
              colorText: Colors.white,
              backgroundColor: Colors.black,
            );
            box.write("liveBidStart", true);
            log(box.read('liveBidStart').toString(),name: "LiveBid value====>>>");
            liveBidStart.value=true;
            Get.find<CommonController>().getCustomerStatus(1);
            var startTime = DateTime.now();
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('timer_start_time', startTime.millisecondsSinceEpoch);
            Get.to(() => LiveBiddingPage());
            return true;
          } else {
            throw 'ID not found in response';
          }
        } else {
          throw 'Invalid response format';
        }
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      log('Error occurred: $e');

      // ✅ Show Error Snackbar
      Get.snackbar(
        'Error',
        'Trip Request Failed: $e',
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/models/rental_bid_confirm_model.dart';

class ReturnBidConfirmController extends GetxController {
  var isLoading = false.obs;
  var bidConfirmModel = RentalBidConfirmModel().obs;
  var trackingCode = ''.obs;
  var otp = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> bidConfirm({
    dynamic bidId,
    dynamic tripId,
  }) async {
    try {
      isLoading.value = true;

      SharedPreferencesManager _prefsManager =
          await SharedPreferencesManager.getInstance();
      String? token = _prefsManager.getToken();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Urls.bidConfirm),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['bid_id'] = bidId.toString();
      request.fields['trip_id'] = tripId.toString();

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        dynamic responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null) {
          if (responseBody['status'] == 'success') {
            // trackingCode.value =
            //     responseBody['trip_history']['tracking_id'].toString();
            bidConfirmModel.value =
                RentalBidConfirmModel.fromJson(responseBody);


            otp.value = bidConfirmModel.value.data!.tripConfirm!.otp.toString();
            Get.snackbar('Success', 'Bid Confirm Successfully',
                colorText: white, backgroundColor: Colors.black);
            print(
                "Bid Confirm Data is============================$responseBody");
          } else {
            throw 'Failed: ${responseBody['message']}';
          }
        } else {
          throw 'Failed!';
        }
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      log('Error $e');
      Get.snackbar('Sorry', 'Trip Request Failed $e',
          colorText: white, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/models/customer_return_bid_model.dart';

class ReturnTripConfirmController extends GetxController {
  var isLoading = false.obs;
  var customerBid = CustomerReturnBidModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> returnTripConfirm({
    required String pickUpLocation,
    required String dropOffMap,
    required String price,
    required String map,
    required String dropLocation,
    required String partnerId,
    required String partnerBidId,
  }) async {
    try {
      isLoading.value = true;

      SharedPreferencesManager _prefsManager =
          await SharedPreferencesManager.getInstance();
      String? token = _prefsManager.getToken();

      var body = {
        "partner_trip_id": partnerBidId,
        "partner_id": partnerId,
        "pickup_location": pickUpLocation,
        "dropoff_location": dropLocation,
        "price": price,
        "token": token.toString(),
        "map": map,
        "dropoff_map": dropOffMap
      };

      var response = await http.post(
        Uri.parse(Urls.returnBidConfirm),
        body: body,
      );

      if (response.statusCode == 200) {
        dynamic responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null) {
          if (responseBody['status'] == 'success') {
            customerBid.value = CustomerReturnBidModel.fromJson(responseBody);

            // Get.snackbar('Success', 'Your Return Bid Confirm',
            //     colorText: white, backgroundColor: Colors.black);
            print("Bid confirm data $responseBody");
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
      Get.snackbar('Error', 'Trip Request $e',
          colorText: white, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }
}

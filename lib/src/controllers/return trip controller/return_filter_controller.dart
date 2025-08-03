import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/configs/local_storage.dart';
import 'package:jatri_app/src/models/filter_return_trip_model.dart';

class ReturnTripFilter extends GetxController {
  var isLoading = false.obs;
  var filterReturnTripModel = FilterReturnTripModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> returnTripFilter({
    required String pickUpLocation,
    required String carId,
    required String dropLocation,
  }) async {
    try {
      isLoading.value = true;

      SharedPreferencesManager _prefsManager =
          await SharedPreferencesManager.getInstance();
      String? token = _prefsManager.getToken();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(Urls.returnFilter),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['pickup_division'] = pickUpLocation;
      request.fields['dropoff_division'] = dropLocation;
      request.fields['vehicle_id'] = carId;

      var response = await http.Response.fromStream(await request.send());
      print(response.body);

      if (response.statusCode == 200) {
        dynamic responseBody = await BaseClient.handleResponse(response);

        if (responseBody != null) {
          if (responseBody['status'] == 'success') {
            filterReturnTripModel.value =
                FilterReturnTripModel.fromJson(responseBody);


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
      Get.snackbar('Error', 'Trip Request Failed $e',
          colorText: white, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> returnTripFilterList({
    required String pickUpLocation,
    required String carId,
    required String dropLocation,
  }) async {
    try {
      isLoading.value = true;
      var request = http.Request('GET', Uri.parse(Urls.allList));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseBody);

        filterReturnTripModel.value = FilterReturnTripModel.fromJson(jsonData);
      }
      else {
        print(response.reasonPhrase);
      }

    } catch (e) {
      log('Error $e');
      Get.snackbar('Error', 'Trip Request Failed $e',
          colorText: white, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<FilterReturnTrip>> fetchReturnTrips({required String pickUpLocation, required String carID, required String dropOff}) async {
    try {
      await returnTripFilter(
        pickUpLocation: pickUpLocation,
        carId: carID,
        dropLocation: dropOff,
      );

      return filterReturnTripModel.value.data ?? [];
    } catch (e) {
      print('Error fetching return trips: $e');
      return [];
    }
  }
}

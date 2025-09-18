import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/all_service_model.dart';
import 'package:jatri_app/src/models/rental_trip_history_model.dart';

import '../../configs/local_storage.dart';
import '../../models/DivisionTripHistoryModel.dart';
import '../../models/ReturnTripHostoryModel.dart';
import '../../models/TripHistoryModel.dart';

class RentalTripHistoryController extends GetxController {
  var isLoading = false.obs;
  var allTripHistory = <SortedTrips>[].obs;
  var rentalTripHistory = <Rental>[].obs;
  var confirmTripHistory = <TripConfirmHistory>[].obs;
  var cancelTripHistory = <TripCancelHistory>[].obs;
  var startTripHistory = <TripStartHistory>[].obs;
  var completeTripHistory = <TripCompleteHistory>[].obs;
  var divisionCancelTripHistory = <DivisionTripCancelHistory>[].obs;
  var divisionConfirmTripHistory = <DivisionTripConfirmHistory>[].obs;
  var divisionTripCompleteHistory = <DivisionTripCompleteHistory>[].obs;
  var returnTripCancelHistory = <ReturnTripCancelHistory>[].obs;
  var returnTripCompleteHistory = <ReturnTripCompleteHistory>[].obs;
  var returnTripStartHistory = <ReturnTripStartHistory>[].obs;
  var returnTripConfirmHistory = <ReturnTripConfirmHistory>[].obs;
  var allSortingTripHistoryData = AllServiceModel().obs;
  var allConfirmSortingTripHistoryData = AllServiceModel().obs;
  var allStartSortingTripHistoryData = AllServiceModel().obs;
  var allCompleteSortingTripHistoryData = AllServiceModel().obs;
  var allCancelSortingTripHistoryData = AllServiceModel().obs;

  @override
  void onInit() async {
    getTrip();
    getDivisionTrip();
    getReturnTrip();
    getAllSortingTrip();
    super.onInit();
  }

 void getTrip() async {

      isLoading(true);
log("message");
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.tripHistory),
      );

      if (responseBody != null) {
      // final AllTripModel historyModel = AllTripModel.fromJson(responseBody);
      // allTripHistory.clear();
      // allTripHistory.addAll(historyModel.sortedTrips!);
        final TripHistoryModel historyModel =
        TripHistoryModel.fromJson(responseBody);
      confirmTripHistory.clear();
      cancelTripHistory.clear();
      completeTripHistory.clear();
      startTripHistory.clear();
      confirmTripHistory.assignAll(historyModel.tripConfirmHistory!);
      cancelTripHistory.assignAll(historyModel.tripCancelHistory!);
      startTripHistory.assignAll(historyModel.tripStartHistory!);
      completeTripHistory.assignAll(historyModel.tripCompleteHistory!);
      print(startTripHistory);
      } else {
        throw 'Unable to load slider data!';
      }

  }

  void getDivisionTrip() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.divisionTripHistory),
      );

      if (responseBody != null) {
        final DivisionTripHistoryModel historyModel =
            DivisionTripHistoryModel.fromJson(responseBody);
        divisionConfirmTripHistory.clear();
        divisionCancelTripHistory.clear();
        divisionTripCompleteHistory.clear();
        divisionTripCompleteHistory
            .assignAll(historyModel.divisionTripCompleteHistory!);
        divisionCancelTripHistory
            .assignAll(historyModel.divisionTripCancelHistory!);
        divisionConfirmTripHistory
            .assignAll(historyModel.divisionTripConfirmHistory!);

        print(startTripHistory);
      } else {
        throw 'Unable to load slider data!';
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void getReturnTrip() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.rentalTripHistory),
      );

      if (responseBody != null) {
        final ReturnTripHistoryModel historyModel =
            ReturnTripHistoryModel.fromJson(responseBody);
        returnTripCancelHistory.clear();
        returnTripCompleteHistory.clear();
        returnTripStartHistory.clear();
        returnTripConfirmHistory.clear();
        returnTripCancelHistory
            .assignAll(historyModel.returnTripCancelHistory!);
        returnTripConfirmHistory
            .assignAll(historyModel.returnTripConfirmHistory!);
        returnTripCompleteHistory
            .assignAll(historyModel.returnTripCompleteHistory!);
        returnTripStartHistory.assignAll(historyModel.returnTripStartHistory!);
      } else {
        throw 'Unable to load slider data!';
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> divisionCancelTrip(String id) async {
    SharedPreferencesManager _prefsManager =
        await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();
    final String url = Urls.historyCancel;
    final Map<String, dynamic> data = {'division_confirm_id': id};

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print('Request successful: ${response.body}');
      Get.snackbar('Request successful', "Trip Update Success", backgroundColor: Colors.greenAccent);
      update();
      Get.off(() => DashboardView());
    } else {
      Get.snackbar('Error', 'Unable to cancel', backgroundColor: Colors.red);
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> getAllSortingTrip() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse(Urls.allSortingTrip));
    request.headers.addAll(headers);
    isLoading(true);
    http.StreamedResponse response = await request.send();
    isLoading(false);
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      debugPrint('Response body: $responseBody');

      // try {
        var jsonData = jsonDecode(responseBody);
        debugPrint('Decoded JSON: $jsonData');
        allSortingTripHistoryData.value = AllServiceModel.fromJson(jsonData);

        debugPrint('success ::: all trip');
      // } catch (e) {
      //   debugPrint('Error decoding JSON: $e');
      // }
    } else {
      debugPrint('failed :: all trip');
    }
  }

  Future<void> getAllConfirmSortingTrip() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse(Urls.allConfirmSortingTrip));
    request.headers.addAll(headers);
    isLoading(true);
    http.StreamedResponse response = await request.send();
    isLoading(false);
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      debugPrint('Response body: $responseBody');

      try {
        var jsonData = jsonDecode(responseBody);
        debugPrint('Decoded JSON: $jsonData');
        allConfirmSortingTripHistoryData.value = AllServiceModel.fromJson(jsonData);

        debugPrint('success ::: all trip');
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
      }
    } else {
      debugPrint('failed :: all trip');
    }
  }

  Future<void> getAllStartSortingTrip() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse(Urls.allStartSortingTrip));
    request.headers.addAll(headers);
    isLoading(true);
    http.StreamedResponse response = await request.send();
    isLoading(false);
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      debugPrint('Response body: $responseBody');

      try {
        var jsonData = jsonDecode(responseBody);
        debugPrint('Decoded JSON: $jsonData');
        allStartSortingTripHistoryData.value = AllServiceModel.fromJson(jsonData);

        debugPrint('success ::: all trip');
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
      }
    } else {
      debugPrint('failed :: all trip');
    }
  }

  Future<void> getAllCompleteSortingTrip() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse(Urls.allCompleteSortingTrip));
    request.headers.addAll(headers);
    isLoading(true);
    http.StreamedResponse response = await request.send();
    isLoading(false);
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      debugPrint('Response body: $responseBody');

      try {
        var jsonData = jsonDecode(responseBody);
        debugPrint('Decoded JSON: $jsonData');
        allCompleteSortingTripHistoryData.value = AllServiceModel.fromJson(jsonData);

        debugPrint('success ::: all trip');
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
      }
    } else {
      debugPrint('failed :: all trip');
    }
  }

  Future<void> getAllCancelSortingTrip() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    var headers = {
      'Authorization': 'Bearer $token'
    };

    var request = http.Request('GET', Uri.parse(Urls.allCancelSortingTrip));
    request.headers.addAll(headers);
    isLoading(true);
    http.StreamedResponse response = await request.send();
    isLoading(false);
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      debugPrint('Response body: $responseBody');

      try {
        var jsonData = jsonDecode(responseBody);
        debugPrint('Decoded JSON: $jsonData');
        allCancelSortingTripHistoryData.value = AllServiceModel.fromJson(jsonData);

        debugPrint('success ::: all trip');
      } catch (e) {
        debugPrint('Error decoding JSON: $e');
      }
    } else {
      debugPrint('failed :: all trip');
    }
  }

}

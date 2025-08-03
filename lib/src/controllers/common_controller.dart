
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jatri_app/src/models/status_model.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/pages/home/homePage.dart';
import 'package:jatri_app/src/pages/profile/profilePage.dart';
import 'package:http/http.dart' as http;

import '../configs/local_storage.dart';

class CommonController extends GetxController {
  //bottom-nav
  List page = [HomePage(), AllTripHistoryPage(), ProfilePage()];
  var selectedPageIndex = 0.obs;
  var data=StatusModel().obs;
  //bottom-action
  void chanageBottomPageIndex(int seletedPage) {
    selectedPageIndex.value = seletedPage;
    debugPrint(selectedPageIndex.value.toString());
  }


  Future<void> getCustomerStatus(status) async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var url = Uri.parse('https://garilagbee.com/api/v1/customer/status?status=$status');

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        log("Status Success");
        print(response.body);
        var d=jsonDecode(response.body);
        log(d.toString(),name: "Ongoing Trip Status");
        data.value=StatusModel.fromJson(d);
      } else {
        print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      }
      data.refresh();
    } catch (e) {
      print('Exception occurred: $e');
    }
  }


}

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../configs/appBaseUrls.dart';
import '../../../configs/local_storage.dart';
import '../../../models/newSearchModel.dart';

class SearchControllers extends GetxController {
  var searchModel = Rxn<NewSearchModel>();
  var isLoading = false.obs;
  var searchText = TextEditingController();
  var returnData = <ReturnData>[].obs;
  // var advanceData = <AdvanceData>[].obs;
  var tripRwq = <PartnerTripRequests>[].obs;

  Future<void> fetchList({required String name}) async {
    SharedPreferencesManager _prefsManager =
        await SharedPreferencesManager.getInstance();
    returnData.clear();

    tripRwq.clear();
    final url = Uri.parse(
        "${Urls.searchList}$name");
    String? token = _prefsManager.getToken();
    log(token.toString());
    try {
      isLoading(true);
      final headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        searchModel.value = NewSearchModel.fromJson(jsonData);
        returnData.value=searchModel.value!.returnData!;
        // advanceData.value=searchModel.value!.advanceData!;
        tripRwq.value=searchModel.value!.partnerTripRequests!;
        print("Response: $jsonData");
      } else {
        print("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    } finally {
      isLoading(false);
    }
  }
}

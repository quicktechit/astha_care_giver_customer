import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/models/quick_tech_service_type_model.dart';
import 'package:jatri_app/src/widgets/quick_tech_loader_util.dart';

import '../../configs/appBaseUrls.dart';

class QuickTechServiceController extends GetxController{
  var serviceData = QuickTechServiceTypeModel().obs;

  Future<void> getServices() async {
    LoaderUtils().showGetLoading();
    var request = http.Request('GET', Uri.parse('${Urls.domain}/servicetypes'));

    http.StreamedResponse response = await request.send();
   LoaderUtils().hideGetLoading();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseBody);

      serviceData.value = QuickTechServiceTypeModel.fromJson(jsonData);
      debugPrint("Data stored successfully in serviceData.");
    } else {
      debugPrint("Error: ${response.reasonPhrase}");
    }
  }
}
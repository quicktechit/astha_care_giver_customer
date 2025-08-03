import 'dart:developer';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/division_model.dart';

class DivisionController extends GetxController {
  var isLoading = false.obs;
  var divisionList = <DivisionList>[].obs;

  @override
  void onInit() async {
    getDivision();
    super.onInit();
  }

  void getDivision() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.division),
      );

      if (responseBody != null) {
        final DivisionModel division = DivisionModel.fromJson(responseBody);

        if (division.data != null && division.data!.isNotEmpty) {
          divisionList.assignAll(division.data!);
        } else {
          throw 'data is empty!';
        }
      } else {
        throw 'Unable to load slider data!';
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

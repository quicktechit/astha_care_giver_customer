import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/notifications_model.dart';

import '../../configs/local_storage.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notificationData = <NotificationData>[].obs;

  @override
  void onInit() async {
    getNotification();
    super.onInit();
  }

  void getNotification() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.notificationList),
      );

      if (responseBody != null) {
        final NotificationsModel notifiactionModel =
            NotificationsModel.fromJson(responseBody);

        if (notifiactionModel.data != null &&
            notifiactionModel.data!.isNotEmpty) {
          notificationData.assignAll(notifiactionModel.data!);
        } else {
          throw 'Notification data is empty!';
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

  Future<void> getNotificationClean() async {
    SharedPreferencesManager _prefsManager =
        await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();
    final url = Uri.parse(Urls.clearNotification);

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        Get.to(() => DashboardView());
        Get.snackbar('success', "delete data success");
        getNotification();
      } else {
        Get.back();
        Get.snackbar('Error', "Unable to delete data");
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

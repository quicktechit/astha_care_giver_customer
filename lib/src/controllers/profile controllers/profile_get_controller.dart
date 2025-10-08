import 'dart:developer';

import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/customer_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var customerData = CustomerData().obs;
  var customerName = ''.obs;
  var email = ''.obs;

  var phone = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;
  var city = ''.obs;
  var address = ''.obs;
  var image = ''.obs;

  @override
  void onInit() {
    getProfileData(
        token:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NhcmJvb2suY3V0aWFpZGNvcnBvcmF0aW9uLmNvbS9hcGkvdjEvY3VzdG9tZXIvbG9naW4iLCJpYXQiOjE3MDk0NjEwNzcsImV4cCI6MTcwOTQ2NDY3NywibmJmIjoxNzA5NDYxMDc3LCJqdGkiOiIzYXFIbUFBc1BCZDZtanBHIiwic3ViIjoiMzUiLCJwcnYiOiIxZDBhMDIwYWNmNWM0YjZjNDk3OTg5ZGYxYWJmMGZiZDRlOGM4ZDYzIn0.jjLvB_KCooG_e3jUYWX66AkFQ_jwyRZYMXQk3lbFr7I");
    super.onInit();
  }

  Future getProfileData({String? token}) async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.profile()),
      );

      if (responseBody != null) {
        CustomerProfileModel profileModel =
            CustomerProfileModel.fromJson(responseBody);
        customerData.value=profileModel.data!;

        customerName.value = profileModel.data?.name ?? 'Empty';
        email.value = profileModel.data?.email ?? 'Empty';
        phone.value = profileModel.data?.phone ?? 'Empty';
        dob.value = profileModel.data?.birthday ?? 'Empty';
        gender.value = profileModel.data?.gender ?? 'Empty';
        city.value = profileModel.data?.district ?? 'Empty';
        address.value = profileModel.data?.address ?? 'Empty';
        image.value = profileModel.data?.image ?? 'Empty';
      } else {
        throw 'Unable to load profile data!';
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

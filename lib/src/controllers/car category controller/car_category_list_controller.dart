import 'dart:developer';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/car_category_list_model.dart';

import '../../models/CategoryListModel.dart';

class CarCategoryController extends GetxController {
  var isLoading = false.obs;
  var carListData = <CarData>[].obs;
  var categoryList = <Data>[].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void getCarList(id) async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: "${Urls.carList}$id"),
      );

      if (responseBody != null) {
        final CarCategoryListModel carModel =
            CarCategoryListModel.fromJson(responseBody);

        if (carModel.data != null && carModel.data!.isNotEmpty) {
          carListData.assignAll(carModel.data!);
        } else {
          throw 'Car data is empty!';
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

  void getCategoryList() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
            api: Urls.baseUrl + 'api/v1/partner/categories'),
      );

      if (responseBody != null) {
        final CategoryListModel categoryListmodel =
            CategoryListModel.fromJson(responseBody);

        if (categoryListmodel.data.isNotEmpty) {
          categoryList.assignAll(categoryListmodel.data);
        } else {
          throw 'Car data is empty!';
        }
      } else {
        throw 'Unable to load slider data!';
      }
    } catch (e) {
      log("Category Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

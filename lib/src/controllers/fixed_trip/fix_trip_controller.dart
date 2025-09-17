import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/controllers/profile%20controllers/profile_get_controller.dart';

import '../../components/bottom navbar/bottom.dart';
import '../../configs/appBaseUrls.dart';
import '../../configs/base_client.dart';
import '../../models/reasonListModel.dart';
import '../common_controller.dart';
import '../rental trip request controllers/rental_trip_req_submit_controller.dart';

class QuickTechFixedTripController extends GetxController {
  final controller = Get.put(ProfileController());
  RentalTripSubmitController rentalTripSubmitController = Get.put(RentalTripSubmitController());
  var box=GetStorage();
  var isLoading = false.obs;
  var reasonListModel = ReasonListModel().obs;
  var customerBoforeData = <CustomerBoforeData>[].obs;
  var customerAfterData = <CustomerAfterData>[].obs;

  Future<void> fetchReasonList() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(Urls.cancelReason));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        customerBoforeData.clear();
        customerAfterData.clear();
        reasonListModel.value = ReasonListModel.fromJson(data);
        customerAfterData.value = reasonListModel.value.customerAfterData!;
        customerBoforeData.value = reasonListModel.value.customerBoforeData!;
        print(reasonListModel.value);
      } else {
        // Handle error
        log(response.statusCode.toString());
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error:--------------- $e-------------------');
    } finally {
      isLoading(false); // Stop loading
    }
  }

  Future cancelReqTrip({
    required String tripId,
    required String reasonId,
  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['trip_id'] = tripId;
      map['cancelreason_id'] = reasonId;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Urls.tripReqCancel,
          body: map,
        ),
      );

      if (responseBody != null) {
        if (responseBody['status'] == "success") {
          kSnackBar(message: "Trip Cancel Successfully", bgColor: Colors.green);

          box.write("liveBidStart", false);
          rentalTripSubmitController.liveBidStart.value = false;
          Get.find<CommonController>().getCustomerStatus(0);
          Get.to(() => DashboardView(), transition: Transition.circularReveal);
        } else {
          kSnackBar(message: "Trip Cancel Unsuccessfully reason: ${responseBody['message']}", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  // Future cancelRentalTrip(
  //   String id,
  //   String reasonId,
  // )
  // async {
  //   try {
  //     var map = <String, dynamic>{};
  //     map['tripconfirm_id'] = id;
  //     map['customer_id'] = controller.customerData.value.id.toString();
  //     map['cancelreason_id'] = reasonId;
  //     dynamic responseBody = await BaseClient.handleResponse(
  //       await BaseClient.postRequest(
  //         api: Urls.returnTripConfirmCancel,
  //         body: map,
  //       ),
  //     );
  //     if (responseBody != null) {
  //       if (responseBody['status'] == "success") {
  //         kSnackBar(message: "Trip Cancel Successfully", bgColor: Colors.green);
  //         Get.to(() => DashboardView(), transition: Transition.circularReveal);
  //       } else {
  //         kSnackBar(
  //             message:
  //                 "Trip Cancel Unsuccessfully reason: ${responseBody['message']}",
  //             bgColor: Colors.red);
  //       }
  //
  //       isLoading(false);
  //     } else {
  //       throw 'Failed!';
  //     }
  //   } catch (e) {
  //     kSnackBar(message: e.toString(), bgColor: Colors.red);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future cancelReturnReqTrip({
    required String id,
    required String reasonId,
  })
  async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};
      map['tripconfirm_id'] = id;
      map['customer_id'] = controller.customerData.value.id.toString();
      map['cancelreason_id'] = reasonId;

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Urls.returnTripConfirmCancel,
          body: map,
        ),
      );

      if (responseBody != null) {
        if (responseBody['status'] == "success") {
          kSnackBar(message: "Trip Cancel Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(), transition: Transition.circularReveal);
        } else {
          kSnackBar(
              message:
                  "Trip Cancel Unsuccessfully reason: ${responseBody['message']}",
              bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  Future cancelDivisionTrip(String id) async {
    var map = <String, dynamic>{};
    map['division_confirm_id'] = id;
    dynamic responseBody = await BaseClient.handleResponse(
      await BaseClient.postRequest(
        api: Urls.returnTripConfirmCancel,
        body: map,
      ),
    );
    if (responseBody != null) {
      if (responseBody['status'] == "success") {
        kSnackBar(message: "Trip Cancel Successfully", bgColor: Colors.green);
        Get.to(() => DashboardView(), transition: Transition.circularReveal);
      } else {
        kSnackBar(
            message:
                "Trip Cancel Unsuccessfully reason: ${responseBody['message']}",
            bgColor: Colors.red);
      }
      isLoading(false);
    } else {
      kSnackBar(
          message:
          "Trip Cancel Unsuccessfully reason: ${responseBody['message']}",
          bgColor: Colors.red);
      throw 'Failed!';
    }
  }

  Future cancelConfirmTrip({
    required String tripId,
    required String reasonId,
  }) async {
    try {
      isLoading(true);

      var map = <String, dynamic>{};

      map['cancelreason_id'] = reasonId;
      map['tripconfirm_id'] = tripId;
      map['customer_id'] = controller.customerData.value.id.toString();

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Urls.tripConfirmCancel,
          body: map,
        ),
      );

      if (responseBody != null) {
        if (responseBody['status'] == "success") {
          kSnackBar(message: "Trip Cancel Successfully", bgColor: Colors.green);
          Get.to(() => DashboardView(), transition: Transition.circularReveal);
        } else {
          kSnackBar(message: "Trip Cancel Unsuccessfully", bgColor: Colors.red);
        }

        isLoading(false);
      } else {
        throw 'Failed!';
      }
    } catch (e) {
      log('----------------${e.toString()}--------------------');
      kSnackBar(message: e.toString(), bgColor: Colors.red);
    } finally {
      isLoading(false);
    }
  }

  void cancelTripRequestReason(
    BuildContext context,
    String tripId,
    String reasonId,
    String type,
    List<CustomerBoforeData> data,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Cancel trip?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Why do you want to cancel?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.no_crash),
                          title: Text(data[index].title.toString()),
                          onTap: () {
                            if (type == 'req') {
                              cancelReqTrip(tripId: tripId, reasonId: reasonId);
                            } else {
                              cancelConfirmTrip(
                                tripId: tripId,
                                reasonId: reasonId,
                              );
                            }
                          },
                        );
                      }),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Keep my trip"),
                ),
              ],
            ),
          );
        });
  }

  void kSnackBar({required String message, required Color bgColor}) {
    if (!Get.isSnackbarOpen) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: bgColor,
          message: message,
          maxWidth: 1170,
          duration: const Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          margin: const EdgeInsets.all(10),
          borderRadius: 5,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    }
  }
}

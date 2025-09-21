import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/single%20trip%20details%20controller/single_trip_details_controller.dart';
import 'package:jatri_app/src/models/single_service_details_model.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/car%20selected%20option/car_selected_option_widget.dart';
import 'package:jatri_app/src/widgets/partner_info_widget.dart';
import 'package:jatri_app/src/widgets/single_trip_history_title_widget.dart';
import 'package:jatri_app/src/widgets/trip_info_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class SingleHistoryTripDetailsPage extends StatefulWidget {
  final String tripId;

  const SingleHistoryTripDetailsPage({super.key, required this.tripId});

  @override
  State<SingleHistoryTripDetailsPage> createState() =>
      SingleHistoryTripDetailsPageState();
}

class SingleHistoryTripDetailsPageState
    extends State<SingleHistoryTripDetailsPage> {
  final SingleTripDetailsController _singleTripDetailsController =
      Get.put(SingleTripDetailsController());
  var formattedDate;
  var time = '';
  TripHistory? data;
  @override
  void initState() {
    super.initState();

    _singleTripDetailsController.singleTripDetails(widget.tripId).then((value) {
      var inputText = _singleTripDetailsController
              .singleTripDetailsModel.value.data?.tripHistory?.datetime
              .toString() ??
          "";
      data = _singleTripDetailsController
          .singleTripDetailsModel.value.data?.tripHistory;
      List<String>? parts = inputText.split(' ');
      String? date = parts[0];
      time = parts[1] + ' ' + parts[2];
      List<String>? dateParts = date.split('-');
      formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        appbarTitle: 'Service Details',
      ),
      body: Obx(() => _singleTripDetailsController.isLoading.value
          ? loader()
          : _singleTripDetailsController.singleTripDetailsModel.value.data ==
                  null
              ? "No Data Found".text.semiBold.makeCentered()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TripIDWidget(
                      //   tripId:
                      //       '#${_singleTripDetailsController.singleTripDetailsModel.value.data?.tripHistory?.trackingId == null ? "N/A" : _singleTripDetailsController.singleTripDetailsModel.value.data?.tripHistory?.trackingId.toString()}',
                      // ),
                      // SizedBox(height: 20.h),
                      TripInfoWidget(
                        pick: _singleTripDetailsController
                                .singleTripDetailsModel
                                .value
                                .data
                                ?.tripHistory
                                ?.pickupLocation
                                .toString() ??
                        '',
                        drop: '',
                        journeyTime: "$formattedDate $time",
                      ),
                      SizedBox(height: 20.h),
                      CarSelectedOption(
                        carImg:
                            "${_singleTripDetailsController.singleTripDetailsModel.value.data?.tripHistory?.agencyService?.image.toString()}",
                        carName: _singleTripDetailsController
                                .singleTripDetailsModel
                                .value
                                .data
                                ?.tripHistory
                                ?.name
                                .toString() ??
                            '',
                        age: "Age: ${ data?.age}",
                        agency: data?.agencyService?.agencyType.toString(),
                        type: "Service Provided: ${data?.isHourly != 0
                            ? "Hourly"
                            : data?.isDaily != 0
                            ? "Daily"
                            : data?.isWeekly != 0
                            ? "Weekly"
                            : data?.isMonthly != 0
                            ? "Monthly"
                            : ''}",
                      ),
                      SizedBox(height: 20.h),
                      PartnerInfoWidget(
                        partnerName: _singleTripDetailsController
                                .singleTripDetailsModel
                                .value
                                .data
                                ?.partner
                                ?.name
                                .toString() ??
                            '',
                        partnerCall: _singleTripDetailsController
                                  .singleTripDetailsModel
                                  .value
                                  .data
                                ?.partner
                                ?.phone
                                .toString() ??
                            '',
                        partnerImg: Urls.getImageURL(
                          endPoint:
                              "${_singleTripDetailsController.singleTripDetailsModel.value.data?.partner?.image.toString()}",
                        ),
                        onTap: () async {
                          final Uri url = Uri(
                              scheme: 'tel',
                                path: _singleTripDetailsController
                                    .singleTripDetailsModel
                                    .value
                                    .data
                                  ?.partner
                                  ?.phone
                                  .toString());

                          if (await launchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        title: 'Provider Info',
                      ),
                      SizedBox(height: 20.h),
                      SingleTripHistoryWidget(
                        title: 'Service OTP :',
                    subTitle: _singleTripDetailsController
                                .singleTripDetailsModel
                                .value
                                .data
                                ?.tripHistory
                                ?.otp ==
                            1
                        ? "Verified"
                        : "${_singleTripDetailsController.singleTripDetailsModel.value.data?.tripHistory?.otp.toString()}",
                  ),
                  SingleTripHistoryWidget(
                        title: 'Total amount :',
                        subTitle:
                            "${_singleTripDetailsController.singleTripDetailsModel.value.data?.tripHistory?.tripConfirm?.amount.toString()}Tk",
                      ),
                    ],
                  ),
                )),
    );
  }

  /// calculate form api
// double calculateTotalDistance() {
//   String? map = _singleTripDetailsController
//       .singleTripDetailsModel.value.data?.tripHistory?.map;
//   String? dropOffMap = _singleTripDetailsController
//       .singleTripDetailsModel.value.data?.tripHistory?.dropoffMap;
//
//   if (map != null && dropOffMap != null) {
//     return _singleTripDetailsController.calculateDistance(map, dropOffMap);
//   } else {
//     return 0.0;
//   }
// }
}

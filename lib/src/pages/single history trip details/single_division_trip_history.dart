import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/single%20trip%20details%20controller/single_trip_details_controller.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/car%20selected%20option/car_selected_option_widget.dart';
import 'package:jatri_app/src/widgets/partner_info_widget.dart';
import 'package:jatri_app/src/widgets/single_trip_history_title_widget.dart';
import 'package:jatri_app/src/widgets/trip_id_widget.dart';
import 'package:jatri_app/src/widgets/trip_info_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleDivisionTripHistory extends StatefulWidget {
  final String tripId;

  const SingleDivisionTripHistory({super.key, required this.tripId});

  @override
  State<SingleDivisionTripHistory> createState() =>
      _SingleDivisionTripHistory();
}

class _SingleDivisionTripHistory extends State<SingleDivisionTripHistory> {
  final SingleTripDetailsController _singleTripDetailsController =
      Get.put(SingleTripDetailsController());
  var formattedDate;
  var time = '';
  @override
  void initState() {
    super.initState();
    log(widget.tripId);
    _singleTripDetailsController.singleDivisionTripDetails(widget.tripId);
    log(widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar(
        appbarTitle: 'Trip Details',
      ),
      body: Obx(() => _singleTripDetailsController.isLoading.value
          ? loader()
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripIDWidget(
                    tripId:
                        '#${_singleTripDetailsController.singleDivisionTripDetailsModel.value.data!.tripHistory!.trackingId == null ? "N/A" : _singleTripDetailsController.singleDivisionTripDetailsModel.value.data?.tripHistory?.trackingId.toString()}',
                  ),
                  SizedBox(height: 20.h),
                  TripInfoWidget(
                    pick: _singleTripDetailsController
                        .singleDivisionTripDetailsModel
                        .value
                        .data?.tripHistory?.pickupLocation.toString()??'',
                    drop: _singleTripDetailsController
                        .singleDivisionTripDetailsModel
                        .value
                        .data?.tripHistory?.dropoffLocation.toString()??'',
                    journeyTime: DateFormat('dd-MM-yyyy hh:mm a').format(
                            DateTime.parse(_singleTripDetailsController
                                .singleDivisionTripDetailsModel
                                .value
                                .data
                                !.tripHistory
                                !.pickupTime.toString()))
                        ,
                  ),
                  SizedBox(height: 20.h),
                  CarSelectedOption(
                    carImg: Urls.getImageURL(
                      endPoint: _singleTripDetailsController
                          .singleDivisionTripDetailsModel
                          .value
                              .data
                              ?.tripHistory
                              ?.getvehicle
                              ?.image
                              .toString() ??
                          '',
                    ),
                    carName: _singleTripDetailsController
                        .singleDivisionTripDetailsModel
                            .value
                            .data
                            ?.tripHistory
                            ?.getvehicle
                            ?.name
                            .toString() ??
                        '',
                    // capacity:
                    //     "${_singleTripDetailsController.singleDivisionTripDetailsModel.value.data?.tripHistory?.getvehicle?.capacity.toString()} Seats Capacity",
                  ),
                  SizedBox(height: 20.h),
                  _singleTripDetailsController.singleDivisionTripDetailsModel
                              .value.data?.tripHistory?.getpartner ==
                          null
                      ? Container()
                      : PartnerInfoWidget(
                          partnerName: _singleTripDetailsController
                              .singleDivisionTripDetailsModel
                              .value
                                  .data
                                  ?.tripHistory
                                  ?.getpartner
                                  ?.name
                                  .toString() ??
                              '',
                          partnerCall: _singleTripDetailsController
                              .singleDivisionTripDetailsModel
                              .value
                                  .data
                                  ?.tripHistory
                                  ?.getpartner
                                  ?.phone
                                  .toString() ??
                              '',
                          partnerImg: Urls.getImageURL(
                            endPoint: _singleTripDetailsController
                                .singleDivisionTripDetailsModel
                                .value
                                    .data
                                    ?.tripHistory
                                    ?.getpartner
                                    ?.image
                                    .toString() ??
                                '',
                          ),
                          onTap: () async {
                            final Uri url = Uri(
                                scheme: 'tel',
                                path: _singleTripDetailsController
                                    .singleDivisionTripDetailsModel
                                    .value
                                    .data
                                    ?.tripHistory
                                    ?.getpartner
                                    ?.phone
                                    .toString());

                            if (await launchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          title: 'Partner Info',
                        ),
                  SizedBox(height: 20.h),
                  _singleTripDetailsController.singleDivisionTripDetailsModel
                              .value.data?.tripHistory?.getpartner ==
                          null
                      ? Container()
                      : PartnerInfoWidget(
                          partnerName: _singleTripDetailsController
                                  .singleDivisionTripDetailsModel
                                  .value
                                  .data
                                  ?.tripHistory
                                  ?.driverName
                                  .toString() ??
                              '',
                          partnerCall: _singleTripDetailsController
                                  .singleDivisionTripDetailsModel
                                  .value
                                  .data
                                  ?.tripHistory
                                  ?.driverPhone
                                  .toString() ??
                              '',
                          partnerImg: Urls.getImageURL(
                            endPoint: _singleTripDetailsController
                                .singleDivisionTripDetailsModel
                                .value
                                    .data
                                    ?.tripHistory
                                    ?.getvehicle
                                    ?.image
                                    .toString() ??
                                '',
                          ),
                          onTap: () async {
                            final Uri url = Uri(
                                scheme: 'tel',
                                path: _singleTripDetailsController
                                    .singleDivisionTripDetailsModel
                                    .value
                                    .data
                                    ?.tripHistory
                                    ?.driverPhone
                                    .toString());

                            if (await launchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          title: 'Driver Info',
                        ),
                  SizedBox(height: 20.h),
                  SingleTripHistoryWidget(
                      title: 'Round Trip :', subTitle: "No"),

                  // SingleTripHistoryWidget(
                  //   title: 'Total Distance :',
                  //   subTitle:
                  //       '${calculateTotalDistance().toStringAsFixed(2)}  km',
                  // ),
                  SingleTripHistoryWidget(
                    title: 'Total Fare :',
                    subTitle: _singleTripDetailsController
                                .singleDivisionTripDetailsModel
                                .value
                                .data
                                ?.tripHistory
                                ?.totalPrice ==
                            null
                        ? "N/A"
                        : "${_singleTripDetailsController.singleDivisionTripDetailsModel.value.data?.tripHistory?.totalPrice.toString()} ৳",
                  ),
                ],
              ),
            )),
    );
  }

  /// calculate form api
// double calculateTotalDistance() {
//   String? map = _singleTripDetailsController
//       .singleDivisionTripDetailsModel.value.data?.tripHistory?.map;
//   String? dropOffMap = _singleTripDetailsController
//       .singleDivisionTripDetailsModel.value.data?.tripHistory?.dropoffMap;
//
//   if (map != null && dropOffMap != null) {
//     return _singleTripDetailsController.calculateDistance(map, dropOffMap);
//   } else {
//     return 0.0;
//   }
// }
}

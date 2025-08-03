import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/empty_box_widget.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20history%20controller/rental_trip_history_controller.dart';
import 'package:jatri_app/src/pages/home/rental/tripHistoryPage.dart';
import 'package:jatri_app/src/pages/single%20history%20trip%20details/single_history_trip_details.dart';
import 'package:jatri_app/src/widgets/history_time_widget.dart';
import 'package:jatri_app/src/widgets/status_widget.dart';

import '../../controllers/distance_controller/distance_time_controller.dart';
import '../../controllers/fixed_trip/fix_trip_controller.dart';
import '../../controllers/home_controller/home_controller.dart';
import '../../models/all_trip_model.dart';
import '../../pages/Trip History/map_page_view.dart';
import '../../pages/single history trip details/single_division_trip_history.dart';
import '../../pages/single history trip details/single_return_trip_history_details.dart';
import '../button/outlineButton.dart';

class ConfirmTripHistory extends StatelessWidget {
  ConfirmTripHistory({super.key});

  final RentalTripHistoryController _controller =
      Get.put(RentalTripHistoryController());
  final HomeController homeController = Get.put(HomeController());
  int maxWordsToShow = 4;
  final QuickTechFixedTripController fixedTripController =
      Get.put(QuickTechFixedTripController());
  final DistanceTimeController distanceTimeController =Get.put(DistanceTimeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isLoading.value
        ? Center(
            child: loader(),
          )
        : _controller
                .allConfirmSortingTripHistoryData.value.sortedTrips!.isEmpty
            ? EmptyBoxWidget(title: 'No trip history available yet!')
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.allConfirmSortingTripHistoryData.value.sortedTrips?.length??0,
                      itemBuilder: (context, index) {
                        var item = _controller.allConfirmSortingTripHistoryData.value.sortedTrips?[index];
                        if (item == null) return SizedBox.shrink();

                        RentalRelationships? rentalData;
                        DivisionRelationships? divisionData;
                        ReturnRelationships? returnData;
                        String? pickUpCoordinates;
                        String? downCoordinates;

                        if (item.rentalRelationships != null) {
                          rentalData = item.rentalRelationships;
                          pickUpCoordinates = rentalData?.trip?.map?.toString();
                          downCoordinates = rentalData?.trip?.dropoffMap;
                        } else if (item.divisionRelationships != null) {
                          divisionData = item.divisionRelationships;
                          pickUpCoordinates = '';
                        } else {
                          returnData = item.returnRelationships;
                          pickUpCoordinates = '';
                        }

                        // Default coordinates
                        double upLat = 0.0, upLng = 0.0, downLat = 0.0, downLng = 0.0;

                        // Parse pickup coordinates
                        if (pickUpCoordinates != null && pickUpCoordinates.contains(' ')) {
                          try {
                            List<String> pickUpParts = pickUpCoordinates.split(' ');
                            upLat = double.parse(pickUpParts[0]);
                            upLng = double.parse(pickUpParts[1]);
                          } catch (e) {
                            print("Error parsing pickup coordinates: $pickUpCoordinates");
                          }
                        }

                        if (downCoordinates != null && downCoordinates.contains(' ')) {
                          try {
                            List<String> downUpParts = downCoordinates.split(' ');
                            downLat = double.parse(downUpParts[0]);
                            downLng = double.parse(downUpParts[1]);
                          } catch (e) {
                            print("Error parsing drop-off coordinates: $downCoordinates");
                          }
                        }

                        var formattedDate;
                        var time = '';
                        if (returnData != null) {
                          var inputText = item
                              .returnRelationships?.returnTrip?.timedate
                              .toString();
                          List<String>? parts = inputText?.split(' ');
                          String? date = parts?[0];
                          time = parts![1] + ' ' + parts[2];
                          List<String>? dateParts = date?.split('-');
                          formattedDate =
                          '${dateParts?[2]}-${dateParts?[1]}-${dateParts?[0]}';
                        }
                        if (rentalData != null) {
                          var inputText = item
                              .rentalRelationships?.trip?.datetime
                              .toString();
                          List<String>? parts = inputText?.split(' ');
                          String? date = parts?[0];
                          time = parts![1] + ' ' + parts[2];
                          List<String>? dateParts = date?.split('-');
                          formattedDate =
                          '${dateParts?[2]}-${dateParts?[1]}-${dateParts?[0]}';
                        }
                        if (divisionData != null) {
                          var inputStr = item.divisionRelationships?.divisionTrip?.pickupTime.toString();

                          DateTime dateTime = DateTime.parse(inputStr!);

                          formattedDate = DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
                        }


                        return InkWell(
                          onTap: () {
                            if(divisionData!=null){
                              Get.to(() => SingleDivisionTripHistory(
                                tripId: item.tripId.toString(),
                              ));
                            }
                            if(rentalData!=null){
                              Get.to(() => SingleHistoryTripDetailsPage(
                                tripId: rentalData!.trip!.id.toString(),
                              ));
                            }
                            if(returnData!=null){
                              Get.to(() => SingleReturnHistoryTripDetailsPage(
                                    tripId: item.id.toString(),
                                  ));
                            }


                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: paddingH10V10,
                                  child: Column(
                                    children: [
                                      sizeH20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          HistoryTimeWidget(
                                            date: '$formattedDate $time',
                                          ),
                                          SizedBox(width: 10.h),
                                          StatusWidget(
                                            icon: Icons.medical_information_outlined,
                                            statusTitle: "CONFIRM",
                                            textColor: Colors.green,
                                          ),
                                          SizedBox(width: 16.h),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     log(item.id.toString());
                                          //     if (returnData != null) {
                                          //       cancelTripRequestReason(
                                          //           context: context,
                                          //           tripId:'',
                                          //           id: item.id.toString(),
                                          //           type: 'return');
                                          //     }
                                          //     if (rentalData != null) {
                                          //       cancelTripRequestReason(
                                          //           context: context,
                                          //           tripId: item.id.toString(),
                                          //           id:'' ,
                                          //           type: 'rental');
                                          //
                                          //     }if(divisionData!=null){
                                          //       fixedTripController.cancelDivisionTrip(item.id.toString());
                                          //     }
                                          //   },
                                          //   child: StatusWidget(
                                          //       icon: Icons.cancel_outlined,
                                          //       statusTitle: 'Cancel trip',
                                          //       textColor: Colors.red),
                                          // ),
                                        ],
                                      ),
                                      sizeH10,
                                      Divider(),
                                      Container(
                                        width: Get.width,
                                        color: white,
                                        child: Padding(
                                          padding: paddingH10V20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/pick.png",
                                                          scale: 20.h,
                                                        ),
                                                        SizedBox(
                                                          width: 3.h,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            rentalData?.trip?.pickupLocation ??
                                                                returnData?.returnTrip?.location ??
                                                                divisionData?.divisionTrip?.pickupLocation ??
                                                                "N/A",
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 12.h,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // sizeH5,
                                                    // Padding(
                                                    //   padding:
                                                    //       EdgeInsets.fromLTRB(
                                                    //           12.h, 0, 10.h, 0),
                                                    //   child: Container(
                                                    //     height: 15,
                                                    //     width: 1,
                                                    //     color: grey,
                                                    //   ),
                                                    // ),
                                                    // sizeH5,
                                                    // Row(
                                                    //   children: [
                                                    //     Image.asset(
                                                    //       "assets/images/map.png",
                                                    //       scale: 20.h,
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 3.h,
                                                    //     ),
                                                    //     Expanded(
                                                    //       child: Text(
                                                    //         rentalData?.trip?.dropoffLocation ??
                                                    //             returnData
                                                    //                 ?.returnTrip
                                                    //                 ?.destination ??
                                                    //             divisionData?.divisionTrip?.dropoffLocation ??
                                                    //             "N/A",
                                                    //         maxLines: 1,
                                                    //         overflow:
                                                    //             TextOverflow
                                                    //                 .ellipsis,
                                                    //         style: TextStyle(
                                                    //           fontSize: 12.h,
                                                    //           fontWeight:
                                                    //               FontWeight
                                                    //                   .w600,
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(4.0.h),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      radius: 30,
                                                      backgroundImage:
                                                      NetworkImage(
                                                        '${Urls.domain}/${rentalData?.vehicle?.image ??
                                                            returnData?.returnVehicle?.image ??
                                                            divisionData?.divisionVehicle?.image ??
                                                            ''}',
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    rentalData?.vehicle?.name ??
                                                        returnData?.returnVehicle?.name ??
                                                        divisionData?.divisionVehicle?.name ??
                                                        "N/A",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      15.0.h, 0, 15.h, 15.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      item.amount == null
                                          ? Container()
                                          : Text(
                                              'Amount: ${item.amount.toString()} ৳',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      outlineButton(
                                        buttonName: 'ম্যাপ',
                                        textColor: black,
                                        outlineColor: grey.shade300,
                                        radius: 5,
                                        height: 35,
                                        width: 70,
                                        fontSize: 14,
                                        onTap: () {
                                          Get.to(
                                                  () => MapWithDirections(
                                                pickUpLat: upLat,
                                                pickUpLng: upLng,
                                                dropUpLat: downLat,
                                                dropUpLng: downLng,
                                              ),
                                              transition: Transition
                                                  .circularReveal);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: CustomPaint(
                                    painter: DrawDottedhorizontalline(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: _controller.divisionConfirmTripHistory.length,
                    //   itemBuilder: (context, index) {
                    //     var item =
                    //         _controller.divisionConfirmTripHistory.value[index];
                    //     return InkWell(
                    //       onTap: () {
                    //         Get.to(() => SingleDivisionTripHistory(
                    //               tripId: item.tripId.toString(),
                    //             ));
                    //       },
                    //       child: Container(
                    //         color: Colors.white,
                    //         child: Column(
                    //           children: [
                    //             Padding(
                    //               padding: paddingH10V10,
                    //               child: Column(
                    //                 children: [
                    //                   sizeH20,
                    //                   Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       HistoryTimeWidget(
                    //                         date: item.getTrip?.pickupTime
                    //                             .toString()??'',
                    //                       ),
                    //                       SizedBox(width: 10.h),
                    //                       StatusWidget(
                    //                           icon: item.status == 0
                    //                               ? Icons.cancel_outlined
                    //                               : Icons.car_crash_rounded,
                    //                           statusTitle: "CONFIRM",
                    //                           textColor: Colors.green),
                    //                       SizedBox(width: 16.h),
                    //
                    //                       GestureDetector(
                    //                         onTap: () {
                    //                           homeController
                    //                               .selectedItemPosition
                    //                               .value = 0;
                    //                           log(item.id.toString());
                    //                           _controller.divisionCancelTrip(
                    //                               item.id.toString());
                    //                         },
                    //                         child: StatusWidget(
                    //                             icon: Icons.cancel_outlined,
                    //                             statusTitle: 'Cancel trip',
                    //                             textColor: Colors.red),
                    //                       ),
                    //                       // item.status == 0 && item.biding == 1
                    //                       //     ? GestureDetector(
                    //                       //         onTap: () {
                    //                       //           Get.to(() =>
                    //                       //               LiveBiddingPage());
                    //                       //         },
                    //                       //         child: Row(
                    //                       //           children: [
                    //                       //             Text("Live Bid"),
                    //                       //             Image.asset(
                    //                       //               "assets/images/live.jpg",
                    //                       //               width: 60,
                    //                       //             ),
                    //                       //           ],
                    //                       //         ),
                    //                       //       )
                    //                       //     : Container(),
                    //                       Spacer(),
                    //                     ],
                    //                   ),
                    //                   sizeH10,
                    //                   Divider(),
                    //                   Container(
                    //                     width: Get.width,
                    //                     color: white,
                    //                     child: Padding(
                    //                       padding: paddingH10V20,
                    //                       child: Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.start,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           Expanded(
                    //                             child: Column(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.start,
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.start,
                    //                               children: [
                    //                                 Row(
                    //                                   children: [
                    //                                     Image.asset(
                    //                                       "assets/images/pick.png",
                    //                                       scale: 20.h,
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 3.h,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Text(
                    //                                         truncateTextIfNeeded(
                    //                                             item.getTrip
                    //                                                     ?.pickupLocation
                    //                                                     .toString() ??
                    //                                                 "",
                    //                                             maxWordsToShow),
                    //                                         maxLines: 1,
                    //                                         overflow:
                    //                                             TextOverflow
                    //                                                 .ellipsis,
                    //                                         style: TextStyle(
                    //                                           fontSize: 12.h,
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w600,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                                 sizeH5,
                    //                                 Padding(
                    //                                   padding:
                    //                                       EdgeInsets.fromLTRB(
                    //                                           12.h, 0, 10.h, 0),
                    //                                   child: Container(
                    //                                     height: 15,
                    //                                     width: 1,
                    //                                     color: grey,
                    //                                   ),
                    //                                 ),
                    //                                 sizeH5,
                    //                                 Row(
                    //                                   children: [
                    //                                     Image.asset(
                    //                                       "assets/images/map.png",
                    //                                       scale: 20.h,
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 3.h,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Text(
                    //                                         truncateTextIfNeeded(
                    //                                             item.getTrip
                    //                                                     ?.dropoffLocation
                    //                                                     .toString() ??
                    //                                                 "",
                    //                                             maxWordsToShow),
                    //                                         maxLines: 1,
                    //                                         overflow:
                    //                                             TextOverflow
                    //                                                 .ellipsis,
                    //                                         style: TextStyle(
                    //                                           fontSize: 12.h,
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w600,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                           Column(
                    //                             children: [
                    //                               Padding(
                    //                                 padding:
                    //                                     EdgeInsets.all(4.0.h),
                    //                                 child: CircleAvatar(
                    //                                   backgroundColor:
                    //                                       Colors.black,
                    //                                   radius: 30,
                    //                                   backgroundImage:
                    //                                       NetworkImage(
                    //                                     Urls.getImageURL(
                    //                                         endPoint: item
                    //                                             .getvehicle?.image
                    //                                             .toString()??''),
                    //                                     scale: 1,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 item.getvehicle?.name ??
                    //                                     "N/A",
                    //                                 style: TextStyle(
                    //                                     fontWeight:
                    //                                         FontWeight.bold),
                    //                               )
                    //                             ],
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.fromLTRB(
                    //                   15.0.h, 0, 15.h, 15.h),
                    //               child: Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   item.amount == null
                    //                       ? Container()
                    //                       : Text(
                    //                           'Fare: ${item.amount.toString()} ৳',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.bold),
                    //                         )
                    //                 ],
                    //               ),
                    //             ),
                    //             Center(
                    //               child: CustomPaint(
                    //                 painter: DrawDottedhorizontalline(),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    ///
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: _controller.returnTripConfirmHistory.length,
                    //   itemBuilder: (context, index) {
                    //     var item =
                    //         _controller.returnTripConfirmHistory.value[index];
                    //     return InkWell(
                    //       onTap: () {
                    //         Get.to(() => SingleReturnHistoryTripDetailsPage(
                    //               tripId: item.id.toString(),
                    //             ));
                    //       },
                    //       child: Container(
                    //         color: Colors.white,
                    //         child: Column(
                    //           children: [
                    //             Padding(
                    //               padding: paddingH10V10,
                    //               child: Column(
                    //                 children: [
                    //                   sizeH20,
                    //                   Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       HistoryTimeWidget(
                    //                         date: item.getTrip?.timedate
                    //                             .toString()??'',
                    //                       ),
                    //                       SizedBox(width: 10.h),
                    //                       StatusWidget(
                    //                           icon: Icons.car_crash_rounded,
                    //                           statusTitle: "CONFIRM",
                    //                           textColor: Colors.green),
                    //                       SizedBox(width: 16.h),
                    //
                    //                       GestureDetector(
                    //                         onTap: () {
                    //                           log(item.id.toString());
                    //                           cancelTripRequestReason(
                    //                             context,
                    //                             item.tripId.toString(),
                    //                             item.id.toString(),
                    //                             'return',
                    //
                    //                           );
                    //                         },
                    //                         child: StatusWidget(
                    //                             icon: Icons.cancel_outlined,
                    //                             statusTitle: 'Cancel trip',
                    //                             textColor: Colors.red),
                    //                       ),
                    //                       // item.status == 0 && item.biding == 1
                    //                       //     ? GestureDetector(
                    //                       //         onTap: () {
                    //                       //           Get.to(() =>
                    //                       //               LiveBiddingPage());
                    //                       //         },
                    //                       //         child: Row(
                    //                       //           children: [
                    //                       //             Text("Live Bid"),
                    //                       //             Image.asset(
                    //                       //               "assets/images/live.jpg",
                    //                       //               width: 60,
                    //                       //             ),
                    //                       //           ],
                    //                       //         ),
                    //                       //       )
                    //                       //     : Container(),
                    //                       Spacer(),
                    //                     ],
                    //                   ),
                    //                   sizeH10,
                    //                   Divider(),
                    //                   Container(
                    //                     width: Get.width,
                    //                     color: white,
                    //                     child: Padding(
                    //                       padding: paddingH10V20,
                    //                       child: Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.start,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           Expanded(
                    //                             child: Column(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.start,
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.start,
                    //                               children: [
                    //                                 Row(
                    //                                   children: [
                    //                                     Image.asset(
                    //                                       "assets/images/pick.png",
                    //                                       scale: 20.h,
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 3.h,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Text(
                    //                                         truncateTextIfNeeded(
                    //                                             item.getTrip
                    //                                                     ?.location
                    //                                                     .toString() ??
                    //                                                 "",
                    //                                             maxWordsToShow),
                    //                                         maxLines: 1,
                    //                                         overflow:
                    //                                             TextOverflow
                    //                                                 .ellipsis,
                    //                                         style: TextStyle(
                    //                                           fontSize: 12.h,
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w600,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                                 sizeH5,
                    //                                 Padding(
                    //                                   padding:
                    //                                       EdgeInsets.fromLTRB(
                    //                                           12.h, 0, 10.h, 0),
                    //                                   child: Container(
                    //                                     height: 15,
                    //                                     width: 1,
                    //                                     color: grey,
                    //                                   ),
                    //                                 ),
                    //                                 sizeH5,
                    //                                 Row(
                    //                                   children: [
                    //                                     Image.asset(
                    //                                       "assets/images/map.png",
                    //                                       scale: 20.h,
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 3.h,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Text(
                    //                                         truncateTextIfNeeded(
                    //                                             item.getTrip
                    //                                                     ?.destination
                    //                                                     .toString() ??
                    //                                                 "",
                    //                                             maxWordsToShow),
                    //                                         maxLines: 1,
                    //                                         overflow:
                    //                                             TextOverflow
                    //                                                 .ellipsis,
                    //                                         style: TextStyle(
                    //                                           fontSize: 12.h,
                    //                                           fontWeight:
                    //                                               FontWeight
                    //                                                   .w600,
                    //                                         ),
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                           Column(
                    //                             children: [
                    //                               Padding(
                    //                                 padding:
                    //                                     EdgeInsets.all(4.0.h),
                    //                                 child: CircleAvatar(
                    //                                   backgroundColor:
                    //                                       Colors.black,
                    //                                   radius: 30,
                    //                                   backgroundImage:
                    //                                       NetworkImage(
                    //                                     Urls.getImageURL(
                    //                                         endPoint: item
                    //                                                 .getvehicle
                    //                                                 ?.image ??
                    //                                             ""),
                    //                                     scale: 1,
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 item.getvehicle?.name ??
                    //                                     "N/A",
                    //                                 style: TextStyle(
                    //                                     fontWeight:
                    //                                         FontWeight.bold),
                    //                               )
                    //                             ],
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.fromLTRB(
                    //                   15.0.h, 0, 15.h, 15.h),
                    //               child: Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   item.amount == null
                    //                       ? Container()
                    //                       : Text(
                    //                           'Fare: ${item.amount.toString()} ৳',
                    //                           style: TextStyle(
                    //                               fontWeight: FontWeight.bold),
                    //                         )
                    //                 ],
                    //               ),
                    //             ),
                    //             Center(
                    //               child: CustomPaint(
                    //                 painter: DrawDottedhorizontalline(),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ));
  }

  void cancelTripRequestReason({
    required BuildContext context,
    required String tripId,
    required String id,
    required String type,
  }) {
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
                Obx(
                  () => SizedBox(
                    height: 160.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            fixedTripController.customerBoforeData.length,
                        itemBuilder: (context, index) {
                          var data = fixedTripController
                              .customerBoforeData[index];
                          return ListTile(
                            leading: Icon(Icons.no_crash),
                            title: Text(
                              data.title.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              Get.back();
                              if (type == 'return') {
                                log('RETURN CALLED');
                                fixedTripController.cancelReturnReqTrip(
                                  reasonId: data.id.toString(),
                                  id: id,
                                );
                              } else {
                                log('RENTAL CALLED');
                                fixedTripController.cancelConfirmTrip(
                                    tripId: tripId,
                                    reasonId: data.id.toString());
                              }
                            },
                          );
                        }),
                  ),
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

  String truncateTextIfNeeded(String text, int maxWords) {
    if (text.isEmpty) {
      return "N/A";
    }

    List<String> words = text.split(RegExp(r'\s+'));
    int wordCount = words.length;

    return wordCount > maxWords ? '${words.take(maxWords).join(" ")}...' : text;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jatri_app/src/controllers/distance_controller/distance_time_controller.dart';
import '../../configs/appBaseUrls.dart';
import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../../configs/empty_box_widget.dart';
import '../../configs/loader.dart';
import '../../controllers/rental trip history controller/rental_trip_history_controller.dart';
import '../../models/all_trip_model.dart';
import '../../pages/Trip History/map_page_view.dart';
import '../../pages/home/rental/tripHistoryPage.dart';
import '../button/outlineButton.dart';
import '../history_time_widget.dart';
import '../text/kText.dart';

class CompleteTripHistory extends StatelessWidget {
   CompleteTripHistory({super.key});
  final RentalTripHistoryController _controller =
  Get.put(RentalTripHistoryController());
  int maxWordsToShow = 4;
DistanceTimeController distanceTimeController =Get.put(DistanceTimeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    _controller.isLoading.value
        ? Center(
      child: loader(),
    )
        : _controller.allCompleteSortingTripHistoryData.value.sortedTrips!.isEmpty
            ? EmptyBoxWidget(title: 'No trip history available yet!')
        : SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.allCompleteSortingTripHistoryData.value.sortedTrips?.length??0,
                itemBuilder: (context, index) {
                  var item = _controller.allCompleteSortingTripHistoryData.value.sortedTrips?[index];
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
                            // if(divisionData!=null){
                            //   Get.to(() => SingleDivisionTripHistory(
                            //     tripId: item.tripId.toString(),
                            //   ));
                            // }
                            // if(rentalData!=null){
                            //   Get.to(() => SingleHistoryTripDetailsPage(
                            //     tripId: rentalData!.trip!.id.toString(),
                            //   ));
                            // }
                            // if(returnData!=null){
                            //   Get.to(() => SingleReturnHistoryTripDetailsPage(
                            //     tripId: item.id.toString(),
                            //   ));
                            // }
                          },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: paddingH10V10,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      clipBehavior:
                                      Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              15),
                                          color: Colors
                                              .black),
                                      height: 60,
                                      width: 60,
                                      child: Image.network(  '${Urls.domain}/${rentalData?.vehicle?.image ??
                                          returnData?.returnVehicle?.image ??
                                          divisionData?.divisionVehicle?.image ??
                                          ''}'),
                                    ),sizeW10,
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        KText(
                                          text: "Day Care",
                                          fontSize: 15,
                                          // rentalData?.vehicle?.name ??
                                          //     returnData?.returnVehicle?.name ??
                                          //     divisionData?.divisionVehicle?.name ??
                                          //     "N/A",
                                        ),
                                        KText(
                                          text: "Quick Agency",
                                          fontSize: 15,
                                          // rentalData?.vehicle?.name ??
                                          //     returnData?.returnVehicle?.name ??
                                          //     divisionData?.divisionVehicle?.name ??
                                          //     "N/A",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                sizeH10,
                                Row(
                                  children: [
                                    Icon(Icons
                                        .access_time),
                                    sizeW10,
                                    KText(
                                      text:
                                      "Monthly",
                                      fontSize: 15,
                                    )
                                  ],
                                ),
                                HistoryTimeWidget(
                                    date:'$formattedDate $time'
                                ),
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
                                              //   EdgeInsets.fromLTRB(
                                              //       12.h, 0, 10.h, 0),
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
                                              //             returnData?.returnTrip?.destination ??
                                              //             divisionData?.divisionTrip?.dropoffLocation ??
                                              //             "N/A",
                                              //         maxLines: 1,
                                              //         overflow:
                                              //         TextOverflow
                                              //             .ellipsis,
                                              //         style: TextStyle(
                                              //           fontSize: 12.h,
                                              //           fontWeight:
                                              //           FontWeight
                                              //               .w600,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
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
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //       itemCount: _controller.completeTripHistory.length,
              //       itemBuilder: (context, index) {
              // var item = _controller.completeTripHistory.value[index];
              //
              // String? pickUpCoordinates =
              // item.map.toString();
              // List<String>? pickUpParts =
              // pickUpCoordinates.split(' ');
              //
              // double upLat = double.parse(pickUpParts![0]);
              // double upLng = double.parse(pickUpParts[1]);
              //
              // String? downCoordinates =
              // item.dropoffMap.toString();
              // List<String>? downUpParts =
              // downCoordinates.split(' ');
              //
              // double downLat = double.parse(downUpParts![0]);
              // double downLng = double.parse(downUpParts[1]);
              //
              // distanceTimeController.calculateDistanceAndDuration(
              //     upLat, upLng, downLat, downLng);
              // return InkWell(
              //   onTap: () {
              //     Get.to(() =>
              //         SingleHistoryTripDetailsPage(
              //           tripId: item.id.toString(),
              //         ));
              //   },
              //   child: Container(
              //     color: Colors.white,
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: paddingH10V10,
              //           child: Column(
              //             children: [
              //               sizeH20,
              //               Row(
              //                 mainAxisAlignment:
              //                 MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   HistoryTimeWidget(
              //                     date: item.datetime.toString(),
              //                   ),
              //                   SizedBox(width: 10.h),
              //                   StatusWidget(
              //                     icon: item.status == 0
              //                         ? Icons.cancel_outlined
              //                         : Icons.car_crash_rounded,
              //                     statusTitle:'COMPLETE',
              //                     textColor:
              //                     Colors.green,
              //                   ),
              //                   SizedBox(width: 16.h),
              //                   item.status == 0 && item.biding == 1
              //                       ? GestureDetector(
              //                     onTap: () {
              //                       Get.to(() => LiveBiddingPage());
              //                     },
              //                     child: Row(
              //                       children: [
              //                         Text("Live Bid"),
              //                         Image.asset(
              //                           "assets/images/live.jpg",
              //                           width: 60,
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //                       : Container(),
              //                   Spacer(),
              //                 ],
              //               ),
              //               sizeH10,
              //               Divider(),
              //               Container(
              //                 width: Get.width,
              //                 color: white,
              //                 child: Padding(
              //                   padding: paddingH10V20,
              //                   child: Row(
              //                     mainAxisAlignment:
              //                     MainAxisAlignment.start,
              //                     crossAxisAlignment:
              //                     CrossAxisAlignment.center,
              //                     children: [
              //                       Expanded(
              //                         child: Column(
              //                           mainAxisAlignment:
              //                           MainAxisAlignment.start,
              //                           crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               children: [
              //                                 Image.asset(
              //                                   "assets/images/pick.png",
              //                                   scale: 20.h,
              //                                 ),
              //                                 SizedBox(
              //                                   width: 3.h,
              //                                 ),
              //                                 Expanded(
              //                                   child: Text(
              //                                     truncateTextIfNeeded(
              //                                         item.pickupLocation ??
              //                                             "",
              //                                         maxWordsToShow),
              //                                     maxLines: 1,
              //                                     overflow:
              //                                     TextOverflow.ellipsis,
              //                                     style: TextStyle(
              //                                       fontSize: 12.h,
              //                                       fontWeight:
              //                                       FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             sizeH5,
              //                             Padding(
              //                               padding: EdgeInsets.fromLTRB(
              //                                   12.h, 0, 10.h, 0),
              //                               child: Container(
              //                                 height: 15,
              //                                 width: 1,
              //                                 color: grey,
              //                               ),
              //                             ),
              //                             sizeH5,
              //                             Row(
              //                               children: [
              //                                 Image.asset(
              //                                   "assets/images/map.png",
              //                                   scale: 20.h,
              //                                 ),
              //                                 SizedBox(
              //                                   width: 3.h,
              //                                 ),
              //                                 Expanded(
              //                                   child: Text(
              //                                     truncateTextIfNeeded(
              //                                         item.dropoffLocation ??
              //                                             "",
              //                                         maxWordsToShow),
              //                                     maxLines: 1,
              //                                     overflow:
              //                                     TextOverflow.ellipsis,
              //                                     style: TextStyle(
              //                                       fontSize: 12.h,
              //                                       fontWeight:
              //                                       FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Column(
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsets.all(4.0.h),
              //                             child: CircleAvatar(
              //                               backgroundColor: Colors.black,
              //                               radius: 30,
              //                               backgroundImage: NetworkImage(
              //                                 Urls.getImageURL(
              //                                     endPoint: item
              //                                         .vehicle?.image
              //                                         .toString()??''),
              //                                 scale: 1,
              //                               ),
              //                             ),
              //                           ),
              //                           Text(
              //                             item.vehicle?.name ?? "N/A",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.bold),
              //                           )
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.fromLTRB(15.0.h, 0, 15.h, 15.h),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               item.amount == null
              //                   ? Container()
              //                   : Text(
              //                 'Fare: ${item.amount.toString()} ৳',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold),
              //               ),
              //               outlineButton(
              //                 buttonName: 'ম্যাপ',
              //                 textColor: black,
              //                 outlineColor: grey.shade300,
              //                 radius: 5,
              //                 height: 35,
              //                 width: 70,
              //                 fontSize: 14,
              //                 onTap: () {
              //                   Get.to(
              //                           () => MapWithDirections(
              //                         pickUpLat: upLat,
              //                         pickUpLng: upLng,
              //                         dropUpLat: downLat,
              //                         dropUpLng: downLng,
              //                       ),
              //                       transition: Transition
              //                           .circularReveal);
              //                 },
              //               ),
              //             ],
              //           ),
              //         ),
              //         Center(
              //           child: CustomPaint(
              //             painter: DrawDottedhorizontalline(),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
              //       },
              //     ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: _controller.divisionTripCompleteHistory.length,
              //   itemBuilder: (context, index) {
              //     var item = _controller
              //         .divisionTripCompleteHistory.value[index];
              //     return InkWell(
              //       onTap: () {
              //         Get.to(() => SingleDivisionTripHistory(
              //           tripId: item.tripId.toString(),
              //         ));
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
              //                     MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       HistoryTimeWidget(
              //                         date: item.getTrip!.pickupTime
              //                             .toString(),
              //                       ),
              //                       SizedBox(width: 10.h),
              //                       StatusWidget(
              //                           icon: item.status == 0
              //                               ? Icons.cancel_outlined
              //                               : Icons.car_crash_rounded,
              //                           statusTitle: "COMPLETE",
              //                           textColor:
              //                                Colors.green
              //                       ),
              //                       SizedBox(width: 16.h),
              //                       // GestureDetector(
              //                       //   onTap: () {
              //                       //     log(item.id.toString());
              //                       //     _controller.cancelTrip(
              //                       //         item.id.toString());
              //                       //   },
              //                       //   child: StatusWidget(
              //                       //       icon: Icons.cancel_outlined,
              //                       //       statusTitle: 'Cancel trip',
              //                       //       textColor: Colors.red),
              //                       // ),
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
              //                         MainAxisAlignment.start,
              //                         crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                         children: [
              //                           Expanded(
              //                             child: Column(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                               crossAxisAlignment:
              //                               CrossAxisAlignment.start,
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
              //                                                 ?.pickupLocation
              //                                                 .toString() ??
              //                                                 "",
              //                                             maxWordsToShow),
              //                                         maxLines: 1,
              //                                         overflow:
              //                                         TextOverflow
              //                                             .ellipsis,
              //                                         style: TextStyle(
              //                                           fontSize: 12.h,
              //                                           fontWeight:
              //                                           FontWeight
              //                                               .w600,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                                 sizeH5,
              //                                 Padding(
              //                                   padding:
              //                                   EdgeInsets.fromLTRB(
              //                                       12.h, 0, 10.h, 0),
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
              //                                                 ?.dropoffLocation
              //                                                 .toString() ??
              //                                                 "",
              //                                             maxWordsToShow),
              //                                         maxLines: 1,
              //                                         overflow:
              //                                         TextOverflow
              //                                             .ellipsis,
              //                                         style: TextStyle(
              //                                           fontSize: 12.h,
              //                                           fontWeight:
              //                                           FontWeight
              //                                               .w600,
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
              //                                 EdgeInsets.all(4.0.h),
              //                                 child: CircleAvatar(
              //                                   backgroundColor:
              //                                   Colors.black,
              //                                   radius: 30,
              //                                   backgroundImage:
              //                                   NetworkImage(
              //                                     Urls.getImageURL(
              //                                         endPoint: item
              //                                             .getvehicle!
              //                                             .image
              //                                             .toString()),
              //                                     scale: 1,
              //                                   ),
              //                                 ),
              //                               ),
              //                               Text(
              //                                 item.getvehicle?.name ??
              //                                     "N/A",
              //                                 style: TextStyle(
              //                                     fontWeight:
              //                                     FontWeight.bold),
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
              //                 MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   item.amount == null
              //                       ? Container()
              //                       : Text(
              //                     'Fare: ${item.amount.toString()} ৳',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold),
              //                   )
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
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: _controller.returnTripCompleteHistory.length,
              //   itemBuilder: (context, index) {
              //     var item = _controller
              //         .returnTripCompleteHistory.value[index];
              //     return InkWell(
              //       onTap: () {
              //         Get.to(() => SingleReturnHistoryTripDetailsPage(
              //           tripId: item.id.toString(),
              //         ));
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
              //                     MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       HistoryTimeWidget(
              //                         date: item.getTrip!.timedate
              //                             .toString(),
              //                       ),
              //                       SizedBox(width: 10.h),
              //                       StatusWidget(
              //                           icon: item.status == 0
              //                               ? Icons.cancel_outlined
              //                               : Icons.car_crash_rounded,
              //                           statusTitle: "COMPLETE",
              //                           textColor:
              //                                Colors.green
              //                       ),
              //                       SizedBox(width: 16.h),
              //                       // GestureDetector(
              //                       //   onTap: () {
              //                       //     log(item.id.toString());
              //                       //     _controller.cancelTrip(
              //                       //         item.id.toString());
              //                       //   },
              //                       //   child: StatusWidget(
              //                       //       icon: Icons.cancel_outlined,
              //                       //       statusTitle: 'Cancel trip',
              //                       //       textColor: Colors.red),
              //                       // ),
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
              //                         MainAxisAlignment.start,
              //                         crossAxisAlignment:
              //                         CrossAxisAlignment.center,
              //                         children: [
              //                           Expanded(
              //                             child: Column(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment.start,
              //                               crossAxisAlignment:
              //                               CrossAxisAlignment.start,
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
              //                                                 ?.location
              //                                                 .toString() ??
              //                                                 "",
              //                                             maxWordsToShow),
              //                                         maxLines: 1,
              //                                         overflow:
              //                                         TextOverflow
              //                                             .ellipsis,
              //                                         style: TextStyle(
              //                                           fontSize: 12.h,
              //                                           fontWeight:
              //                                           FontWeight
              //                                               .w600,
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ],
              //                                 ),
              //                                 sizeH5,
              //                                 Padding(
              //                                   padding:
              //                                   EdgeInsets.fromLTRB(
              //                                       12.h, 0, 10.h, 0),
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
              //                                                 ?.destination
              //                                                 .toString() ??
              //                                                 "",
              //                                             maxWordsToShow),
              //                                         maxLines: 1,
              //                                         overflow:
              //                                         TextOverflow
              //                                             .ellipsis,
              //                                         style: TextStyle(
              //                                           fontSize: 12.h,
              //                                           fontWeight:
              //                                           FontWeight
              //                                               .w600,
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
              //                                 EdgeInsets.all(4.0.h),
              //                                 child: CircleAvatar(
              //                                   backgroundColor:
              //                                   Colors.black,
              //                                   radius: 30,
              //                                   backgroundImage:
              //                                   NetworkImage(
              //                                     Urls.getImageURL(
              //                                         endPoint: item
              //                                             .getvehicle!
              //                                             .image
              //                                             .toString()),
              //                                     scale: 1,
              //                                   ),
              //                                 ),
              //                               ),
              //                               Text(
              //                                 item.getvehicle?.name ??
              //                                     "N/A",
              //                                 style: TextStyle(
              //                                     fontWeight:
              //                                     FontWeight.bold),
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
              //                 MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   item.amount == null
              //                       ? Container()
              //                       : Text(
              //                     'Fare: ${item.amount.toString()} ৳',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.bold),
              //                   )
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

  String truncateTextIfNeeded(String text, int maxWords) {
    if (text == null || text.isEmpty) {
      return "N/A";
    }

    List<String> words = text.split(RegExp(r'\s+'));
    int wordCount = words.length;

    return wordCount > maxWords ? '${words.take(maxWords).join(" ")}...' : text;
  }
}

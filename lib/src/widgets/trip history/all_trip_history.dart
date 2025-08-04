import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/distance_controller/distance_time_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import '../../configs/appBaseUrls.dart';
import '../../configs/empty_box_widget.dart';
import '../../configs/loader.dart';
import '../../controllers/language/langController.dart';
import '../../controllers/rental trip history controller/rental_trip_history_controller.dart';
import '../../models/all_trip_model.dart';
import '../../pages/Trip History/map_page_view.dart';
import '../history_time_widget.dart';

class AllTripHistory extends StatefulWidget {
  const AllTripHistory({super.key});

  @override
  State<AllTripHistory> createState() => _AllTripHistoryState();
}

class _AllTripHistoryState extends State<AllTripHistory> {
  final LangController langController = Get.find();
  final RentalTripHistoryController _controller =
  Get.put(RentalTripHistoryController());
  int maxWordsToShow = 4;
  final DistanceTimeController distanceTimeController =Get.put(DistanceTimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => _controller.isLoading.value
            ? Center(
          child: loader(),
        )
            : _controller.allSortingTripHistoryData.value.sortedTrips == null || _controller.allSortingTripHistoryData.value.sortedTrips!.isEmpty
            ? EmptyBoxWidget(title: 'No trip history available yet!')
            : SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _controller.allSortingTripHistoryData.value.sortedTrips?.length ?? 0,
              itemBuilder: (context, index) {
                var item = _controller.allSortingTripHistoryData.value.sortedTrips?[index];

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

                // Parse drop-off coordinates
                if (downCoordinates != null && downCoordinates.contains(' ')) {
                  try {
                    List<String> downUpParts = downCoordinates.split(' ');
                    downLat = double.parse(downUpParts[0]);
                    downLng = double.parse(downUpParts[1]);
                  } catch (e) {
                    print("Error parsing drop-off coordinates: $downCoordinates");
                  }
                }

                distanceTimeController.calculateDistanceAndDuration(upLat, upLng, downLat, downLng);
                                print(
                                    "${Urls.domain}/${rentalData?.vehicle?.image ?? returnData?.returnVehicle?.image ?? divisionData?.divisionVehicle?.image ?? ''}");
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
                                    // String? tripId = rentalData?.trip?.id?.toString() ??
                                    //     divisionData?.divisionTrip?.id?.toString() ??
                                    //     returnData?.returnTrip?.id?.toString();
                                    //
                                    // if (tripId != null) {
                                    //                   if (divisionData != null) {
                                    //                     Get.to(() => SingleDivisionTripHistory(
                                    //                         tripId: tripId));
                                    //                   } else if(rentalData!=null) {
                                    //                     Get.to(() =>
                                    //                         SingleHistoryTripDetailsPage(
                                    //                             tripId: tripId));
                                    //                   }else{
                                    //                     Get.to(() =>
                                    //                         SingleReturnHistoryTripDetailsPage(
                                    //                             tripId: item.id.toString()));
                                    //                   }
                                    //                 } else {
                                    //                   Get.snackbar("Error", "Trip ID not found", snackPosition: SnackPosition.TOP);
                                    // }
                                  },
                                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [

                              Container(
                                width: Get.width,
                                color: Colors.white,
                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  child: Row(
                                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                  child: Image
                                                                      .network(
                                                                    '${Urls.domain}/${rentalData?.vehicle?.image ?? returnData?.returnVehicle?.image ?? divisionData?.divisionVehicle?.image ?? ''}',
                                                                  ),
                                                                ),
                                                                sizeW5,
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    KText(
                                                                      text:
                                                                          "Day care",
                                                                      // rentalData?.vehicle?.name ??
                                                                      //     returnData?.returnVehicle?.name ??
                                                                      //     divisionData?.divisionVehicle?.name ??
                                                                      //     "N/A",
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                    KText(
                                                                      text:
                                                                          "Quick Agency",
                                                                      // rentalData?.vehicle?.name ??
                                                                      //     returnData?.returnVehicle?.name ??
                                                                      //     divisionData?.divisionVehicle?.name ??
                                                                      //     "N/A",
                                                                      fontSize:
                                                                          15,
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
                                              date: '$formattedDate $time',
                                            ),
                                                            sizeH10,
                                                            Row(
                                                              children: [
                                                Icon(Icons.location_on, size: 20),
                                                SizedBox(width: 5),
                                                Expanded(
                                                  child: Text(
                                                    rentalData?.trip?.pickupLocation ??
                                                        returnData?.returnTrip?.location ??
                                                        divisionData?.divisionTrip?.pickupLocation ??
                                                        "N/A",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),

                                                            // Row(
                                                            //   children: [
                                            //     Icon(Icons.map, size: 20),
                                            //     SizedBox(width: 5),
                                            //     Expanded(
                                            //       child: Text(
                                            //         rentalData?.trip?.dropoffLocation ??
                                            //             returnData?.returnTrip?.destination ??
                                            //             divisionData?.divisionTrip?.dropoffLocation ??
                                            //             "N/A",
                                            //         maxLines: 1,
                                            //         overflow: TextOverflow.ellipsis,
                                            //         style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              item.amount == null
                                  ? Container()
                                  : Text(
                                'Amount: ${item.amount} ৳',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Get.to(
                                        () => MapWithDirections(
                                      pickUpLat: upLat,
                                      pickUpLng: upLng,
                                      dropUpLat: downLat,
                                      dropUpLng: downLng,
                                    ),
                                    transition: Transition.circularReveal,
                                  );
                                },
                                child: Text('ম্যাপ'),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
              },
            )),

            ],
          ),
        ),
      ),
    );
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

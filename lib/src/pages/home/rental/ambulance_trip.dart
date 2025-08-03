// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/live%20location%20controller/live_location_controller.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20request%20controllers/rental_trip_request_check_controller.dart';
import 'package:jatri_app/src/pages/home/rental/tripDetailsPage.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/car%20selected%20option/car_selected_option_widget.dart';
import 'package:jatri_app/src/widgets/date%20and%20time%20widget/date_time_widget.dart';
import 'package:jatri_app/src/widgets/date%20and%20time%20widget/return_date_and_time_widget.dart';
import 'package:jatri_app/src/widgets/drop_point_widget.dart';
import 'package:jatri_app/src/widgets/note_controller.dart';
import 'package:jatri_app/src/widgets/pick_up_location_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:jatri_app/src/widgets/via_location_widget.dart';

class AmbulancePage extends StatefulWidget {
  final String carImg;
  final String carName;
  final String capacity;
  final String category_id;
  final String carId;

  AmbulancePage(
      {required this.carImg,
        required this.carName,
        required this.capacity,
        required this.carId,
        required this.category_id});

  @override
  State<AmbulancePage> createState() => _AmbulancePage();
}

class _AmbulancePage extends State<AmbulancePage> {
  final noteController = TextEditingController();

  var isRoundTrip = false;
  bool isHourly = false;
  int roundTripValue = 0;
  int hourlyTripValue = 0;
  bool showViaLocation = false;

  /// for time and date
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedReturnDate = DateTime.now();
  TimeOfDay selectedReturnTime = TimeOfDay.now();
  final LocationController locationController = Get.put(LocationController());
  final RentalFormCheckController _controller =
  Get.put(RentalFormCheckController());

  int _counter = 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 2) {
        _counter--; // Only decrement if the counter is greater than 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          "ambulance".tr,
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.off(() => DashboardView());
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          /// car selected
          CarSelectedOption(
            carImg: widget.carImg,
            carName: widget.carName,
            // capacity: "${widget.capacity} Seats Capacity",
          ),
          sizeH5,

          /// for location track
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: paddingH10V20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/pick.png",
                        scale: 12,
                      ),
                      sizeH5,
                      Container(
                        height: 80,
                        width: .9,
                        color: black,
                      ),
                      sizeH5,
                      Image.asset(
                        "assets/images/map.png",
                        scale: 12,
                      ),
                    ],
                  ),
                  sizeW20,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: 'pickUpPoint',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        sizeH5,

                        /// pick up point
                        PickUp(),
                        sizeH5,

                        /// via location
                        Visibility(
                          visible: showViaLocation,
                          child: ViaLocation(),
                        ),

                        /// drop point
                        sizeH10,

                        KText(
                          text: 'dropOffPoint',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        sizeH5,

                        /// drop pont
                        DropWidget()
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showViaLocation = !showViaLocation;
                      });
                    },
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: grey.shade300,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: white,
                        child: Icon(
                          showViaLocation ? Icons.close : Icons.add,
                          color: black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          sizeH5,
          DateAndTime(
            onDateTimeSelected: (date, time) {
              selectedDate = date;
              selectedTime = time;
            },
          ),
          // sizeH5,
          // Container(
          //   width: Get.width,
          //   color: white,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 15,
          //     ),
          //     child: Row(
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: black,
          //           child: CircleAvatar(
          //             radius: 11,
          //             backgroundColor: white,
          //             child: Icon(
          //               Icons.timer_outlined,
          //               size: 17,
          //               color: black,
          //             ),
          //           ),
          //         ),
          //         sizeW10,
          //
          //         /// round trip
          //         KText(
          //           text: 'hourly',
          //           fontSize: 14,
          //           fontWeight: FontWeight.bold,
          //         ),
          //         Spacer(),
          //         CupertinoSwitch(
          //           value: isHourly,
          //           activeColor: primaryColor,
          //           thumbColor: white,
          //           onChanged: (val) {
          //             setState(() {
          //               isHourly = val;
          //               hourlyTripValue = isHourly ? 1 : 0;
          //               isRoundTrip = false;
          //               // print("selected round trip $roundTripValue");
          //             });
          //           },
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // if (isHourly) sizeH5,
          // if (isHourly)
          //   Container(
          //     width: Get.width,
          //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     color: Colors.white,
          //     child: Row(
          //       children: [
          //         Icon(
          //           Icons.access_time,
          //           color: grey,
          //         ),
          //         8.horizontalSpace,
          //         KText(
          //           text: 'Duration',
          //           fontWeight: FontWeight.bold,
          //           fontSize: 14,
          //         ),
          //         Spacer(),
          //         IconButton(
          //             color: Colors.red,
          //             style: IconButton.styleFrom(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(13),
          //                   side: BorderSide(color: Colors.red, width: 1.2)),
          //               padding: EdgeInsets.all(10), // Adjust padding if needed
          //               iconSize: 25, // Adjust icon size if needed
          //             ),
          //             onPressed: _decrementCounter,
          //             icon: Icon(Icons.remove)),
          //         20.horizontalSpace,
          //         KText(
          //           text: '$_counter Hour',
          //           fontWeight: FontWeight.bold,
          //           fontSize: 14,
          //         ),
          //         20.horizontalSpace,
          //         IconButton(
          //           color: Colors.red,
          //           onPressed: _incrementCounter,
          //           icon: Icon(Icons.add),
          //           style: IconButton.styleFrom(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(13),
          //                 side: BorderSide(color: Colors.red, width: 1.2)),
          //             padding: EdgeInsets.all(10), // Adjust padding if needed
          //             iconSize: 25, // Adjust icon size if needed
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // sizeH5,
          // Container(
          //   width: Get.width,
          //   color: white,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 15,
          //     ),
          //     child: Row(
          //       children: [
          //         CircleAvatar(
          //           radius: 12,
          //           backgroundColor: black,
          //           child: CircleAvatar(
          //             radius: 11,
          //             backgroundColor: white,
          //             child: Icon(
          //               Ionicons.repeat_outline,
          //               size: 17,
          //               color: black,
          //             ),
          //           ),
          //         ),
          //         sizeW10,
          //
          //         /// round trip
          //         KText(
          //           text: 'Round Trip',
          //           fontSize: 14,
          //           fontWeight: FontWeight.bold,
          //         ),
          //         Spacer(),
          //         CupertinoSwitch(
          //           value: isRoundTrip,
          //           activeColor: primaryColor,
          //           thumbColor: white,
          //           onChanged: (val) {
          //             setState(() {
          //               isRoundTrip = val;
          //               roundTripValue = isRoundTrip ? 1 : 0;
          //               isHourly = false;
          //               print("selected round trip $roundTripValue");
          //             });
          //           },
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // isRoundTrip != true ? Container() : sizeH5,
          // isRoundTrip != true
          //     ? Container()
          //     : ReturnDateAndTime(
          //   onReturnDateTimeSelected: (date, time) {
          //     selectedReturnDate = date;
          //     selectedReturnTime = time;
          //   },
          // ),
          sizeH5,
          NoteTextFiled(
            controller: noteController,
          ),
          sizeH5,
          Obx(
                () => _controller.isLoading.value
                ? loader()
                : Container(
              color: white,
              child: Padding(
                padding: paddingH20V20,
                child: primaryButton(
                  buttonName: 'Trip Form',
                  onTap: () {
                    String hour = selectedTime.hourOfPeriod == 0
                        ? '12'
                        : '${selectedTime.hourOfPeriod}';
                    String minute =
                    '${selectedTime.minute}'.padLeft(2, '0');
                    String period =
                    selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

                    String returnHour = selectedTime.hourOfPeriod == 0
                        ? '12'
                        : '${selectedTime.hourOfPeriod}';
                    String returnMinute =
                    '${selectedTime.minute}'.padLeft(2, '0');
                    String returnPeriod =
                    selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

                    String journeyTimeAndDate =
                    '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} ${hour}:${minute} $period'
                        .toString();

                    /// return journey time
                    String returnJourneyTimeAndDate =
                    '${selectedReturnDate.year}-${selectedReturnDate.month.toString().padLeft(2, '0')}-${selectedReturnDate.day.toString().padLeft(2, '0')} ${returnHour}:${returnMinute} $returnPeriod'
                        .toString();

                    /// pick up lat and lang
                    String pickLatAndLang =
                        '${locationController.selectedPickUpLat} ${locationController.selectedPickUpLng}';

                    /// drop off lat and lang

                    String dropOfLatAndLang =
                        '${locationController.selectedDropUpLat} ${locationController.selectedDropUpLng}';

                    if (locationController.pickUpLocation.isEmpty ||
                        locationController.dropLocation.isEmpty) {
                      Get.snackbar(
                          'Sorry', "Pick & Drop Point Cannot be Empty",
                          colorText: white,
                          backgroundColor: Colors.redAccent);
                      return;
                    } else
                      RentalFormCheckController().rentalForm(
                        pickUpLocation:
                        locationController.pickUpLocation.toString(),
                        viaLocation:
                        locationController.viaLocation.toString(),
                        dropLocation:
                        locationController.dropLocation.toString(),
                        dateTime: journeyTimeAndDate,
                        map: pickLatAndLang,
                        roundTrip: roundTripValue.toString(),
                        roundTripTimeDate: returnJourneyTimeAndDate,
                        vehicleId: widget.carId,
                        dropMap: dropOfLatAndLang, note: noteController.text,
                      );
                    //
                    // Get.to(() => TripDetailsPage(
                    //   carImg: widget.carImg,
                    //   carName: widget.carName,
                    //   capacity: widget.capacity,
                    //   carId: widget.carId,
                    //   pickUpPoint: locationController.pickUpLocation
                    //       .toString(),
                    //   dropPoint:
                    //   locationController.dropLocation.toString(),
                    //   viaPoint:
                    //   locationController.viaLocation.toString(),
                    //   tripDetailsJourney: journeyTimeAndDate,
                    //   roundTrip: roundTripValue.toString(),
                    //   map: pickLatAndLang.toString(),
                    //   roundTripDetailsJourney:
                    //   returnJourneyTimeAndDate,
                    //   dropOffMap: dropOfLatAndLang.toString(),
                    //   category_id: widget.category_id, note:  noteController.text,
                    // ));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

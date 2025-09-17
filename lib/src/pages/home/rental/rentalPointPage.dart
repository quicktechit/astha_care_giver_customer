
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
import 'package:jatri_app/src/widgets/note_controller.dart';
import 'package:jatri_app/src/widgets/pick_up_location_widget.dart';
import 'package:jatri_app/src/widgets/text/custom_text_filed_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class RentalPointPage extends StatefulWidget {
  final String carImg;
  final String carName;
  final String capacity;
  final String service_id;
  final String carId;

  RentalPointPage(
      {required this.carImg,
      required this.carName,
      required this.capacity,
      required this.carId,
      required this.service_id});

  @override
  State<RentalPointPage> createState() => _RentalPointPageState();
}

class _RentalPointPageState extends State<RentalPointPage> {
  final noteController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  var daily = false;
  var weekly = false;
  var monthly = false;
  bool isHourly = false;
  int roundTripValue = 0;
  int hourlyTripValue = 0;
  bool showViaLocation = false;
  final List<String> _genders = ['Male', 'Female', 'Other'];
  String? _selectedGender = 'Male';

  /// for time and date
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedReturnDate = DateTime.now();
  TimeOfDay selectedReturnTime = TimeOfDay.now();
  DateTime selectedWeeklyDate = DateTime.now();
  TimeOfDay selectedWeeklyTime = TimeOfDay.now();
  DateTime selectedMonthlyDate = DateTime.now();
  TimeOfDay selectedMonthlyTime = TimeOfDay.now();

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
          "Service Request".tr,
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
          ),
          sizeH5,
          Container(
            color: Colors.white,
            padding: paddingH10V20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: "User Info",
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                ),
                sizeH5,
                CustomTextFieldWithIcon(
                    icon: CupertinoIcons.person,
                    controller: nameController,
                    hinttext: "Name"),
                sizeH10,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.transgender),
                      sizeW10,
                      DropdownButton<String>(
                        value: _selectedGender,
                        icon: SizedBox.shrink(),
                        hint: const Text('Choose Gender'),
                        underline: SizedBox.shrink(),
                        items: _genders.map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                sizeH10,
                CustomTextFieldWithIcon(
                    icon: CupertinoIcons.calendar,
                    controller: ageController,
                    keyboardType: TextInputType.datetime,
                    hinttext: "Age")
              ],
            ),
          ),
          sizeH5,

          /// for location track
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: paddingH10V20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: 'Location',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  sizeH5,

                  /// pick up point
                  PickUp(),
                  sizeH5,

                  /// via location
                  // Visibility(
                  //   visible: showViaLocation,
                  //   child: ViaLocation(),
                  // ),

                  /// drop point
                  // sizeH10,
                  //
                  // KText(
                  //   text: 'dropOffPoint',
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  // sizeH5,

                  /// drop pont
                  // DropWidget()
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
          sizeH5,
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: black,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: white,
                      child: Icon(
                        Icons.timer_outlined,
                        size: 17,
                        color: black,
                      ),
                    ),
                  ),
                  sizeW10,

                  /// round trip
                  KText(
                    text: 'hourly',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: isHourly,
                    activeColor: primaryColor,
                    thumbColor: white,
                    onChanged: (val) {
                      setState(() {
                        isHourly = val;
                        hourlyTripValue = isHourly ? 1 : 0;
                        daily = false;
                        weekly=false;
                        monthly=false;
                        // print("selected round trip $roundTripValue");
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          if (isHourly) sizeH5,
          if (isHourly)
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: grey,
                  ),
                  8.horizontalSpace,
                  KText(
                    text: 'Duration',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  Spacer(),
                  IconButton(
                      color: Colors.red,
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                            side: BorderSide(color: Colors.red, width: 1.2)),
                        padding: EdgeInsets.all(10), // Adjust padding if needed
                        iconSize: 25, // Adjust icon size if needed
                      ),
                      onPressed: _decrementCounter,
                      icon: Icon(Icons.remove)),
                  20.horizontalSpace,
                  KText(
                    text: '$_counter Hour',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  20.horizontalSpace,
                  IconButton(
                    color: Colors.red,
                    onPressed: _incrementCounter,
                    icon: Icon(Icons.add),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                          side: BorderSide(color: Colors.red, width: 1.2)),
                      padding: EdgeInsets.all(10), // Adjust padding if needed
                      iconSize: 25, // Adjust icon size if needed
                    ),
                  ),
                ],
              ),
            ),
          sizeH5,
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: black,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: white,
                      child: Icon(
                        Ionicons.repeat_outline,
                        size: 17,
                        color: black,
                      ),
                    ),
                  ),
                  sizeW10,

                  /// round trip
                  KText(
                    text: 'Daily',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: daily,
                    activeColor: primaryColor,
                    thumbColor: white,
                    onChanged: (val) {
                      setState(() {
                        daily = val;
                        roundTripValue = daily ? 1 : 0;
                        isHourly = false;
                        print("selected round trip $roundTripValue");
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          // daily != true ? Container() : sizeH5,
          // daily != true
          //     ? Container()
          //     : ReturnDateAndTime(
          //         onReturnDateTimeSelected: (date, time) {
          //           selectedReturnDate = date;
          //           selectedReturnTime = time;
          //         },
          //       ),
          sizeH5,
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: black,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: white,
                      child: Icon(
                        Ionicons.repeat_outline,
                        size: 17,
                        color: black,
                      ),
                    ),
                  ),
                  sizeW10,

                  /// round trip
                  KText(
                    text: 'Weekly',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: weekly,
                    activeColor: primaryColor,
                    thumbColor: white,
                    onChanged: (val) {
                      setState(() {
                        weekly = val;
                        daily = false;
                        isHourly = false;
                        monthly = false;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          // sizeH5,
          // if (weekly)
          //   ReturnDateAndTime(
          //     onReturnDateTimeSelected: (date, time) {
          //       selectedWeeklyDate = date;
          //       selectedWeeklyTime = time;
          //     },
          //   ),
          sizeH5,
          Container(
            width: Get.width,
            color: white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: black,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: white,
                      child: Icon(
                        Ionicons.repeat_outline,
                        size: 17,
                        color: black,
                      ),
                    ),
                  ),
                  sizeW10,

                  /// round trip
                  KText(
                    text: 'Monthly',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    value: monthly,
                    activeColor: primaryColor,
                    thumbColor: white,
                    onChanged: (val) {
                      setState(() {
                        monthly = val;
                        isHourly = false;
                        daily = false;
                        weekly = false;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          // sizeH5,
          // if (monthly)
          //   ReturnDateAndTime(
          //     onReturnDateTimeSelected: (date, time) {
          //       selectedMonthlyDate = date;
          //       selectedMonthlyTime = time;
          //     },
          //   ),
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
                        buttonName: 'Submit',
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
                          String returnWeeklyTimeAndDate =
                              '${selectedWeeklyDate.year}-${selectedWeeklyDate.month.toString().padLeft(2, '0')}-${selectedWeeklyDate.day.toString().padLeft(2, '0')} ${selectedWeeklyTime}'
                                  .toString();
                          String returnMonthlyTimeAndDate =
                              '${selectedMonthlyDate.year}-${selectedMonthlyDate.month.toString().padLeft(2, '0')}-${selectedMonthlyDate.day.toString().padLeft(2, '0')} ${selectedMonthlyTime}'
                                  .toString();

                          /// pick up lat and lang
                          String pickLatAndLang =
                              '${locationController.selectedPickUpLat} ${locationController.selectedPickUpLng}';

                          /// drop off lat and lang

                          String dropOfLatAndLang =
                              '${locationController.selectedDropUpLat} ${locationController.selectedDropUpLng}';

                          if (locationController.pickUpLocation.isEmpty) {
                            Get.snackbar('Sorry', "Location Cannot be Empty",
                                colorText: white,
                                backgroundColor: Colors.redAccent);
                            return;
                          } else{
                            Get.to(() => TripDetailsPage(
                              carImg: widget.carImg,
                              carName: widget.carName,
                              capacity: widget.capacity,
                              carId: widget.carId,
                              pickUpPoint: locationController.pickUpLocation
                                  .toString(),
                              dropPoint:
                              locationController.dropLocation.toString(),
                              viaPoint:
                              locationController.viaLocation.toString(),
                              tripDetailsJourney: journeyTimeAndDate,
                              roundTrip: roundTripValue.toString(),
                              map: pickLatAndLang.toString(),
                              roundTripDetailsJourney:
                              returnJourneyTimeAndDate,
                              dropOffMap: dropOfLatAndLang.toString(),
                              service_id: widget.service_id,
                              note: noteController.text,
                              age: ageController.text.toString(),
                              name: nameController.text.toString(),
                              gender: _selectedGender.toString(),
                              weeklyTime: returnWeeklyTimeAndDate,
                              monthlyTime: returnMonthlyTimeAndDate, monthly: monthly, weekly: weekly, hourly: isHourly,
                            ));
                          }
                            // RentalFormCheckController().rentalForm(
                            //   pickUpLocation:
                            //       locationController.pickUpLocation.toString(),
                            //   viaLocation:
                            //       locationController.viaLocation.toString(),
                            //   dropLocation:
                            //       locationController.dropLocation.toString(),
                            //   dateTime: journeyTimeAndDate,
                            //   map: pickLatAndLang,
                            //   roundTrip: roundTripValue.toString(),
                            //   roundTripTimeDate: returnJourneyTimeAndDate,
                            //   vehicleId: widget.carId,
                            //   dropMap: dropOfLatAndLang, note: noteController.text,
                            // );

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

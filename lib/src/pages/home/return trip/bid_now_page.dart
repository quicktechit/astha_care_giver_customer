// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/components/drawer/sidebarComponent.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/live%20location%20controller/live_location_controller.dart';
import 'package:jatri_app/src/controllers/return%20trip%20controller/return_confirm_bid_controller.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/pages/home/rental/tripHistoryPage.dart';
import 'package:jatri_app/src/pages/home/return%20trip/return_bid_confirm.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/car_container_widget.dart';
import 'package:jatri_app/src/widgets/custom%20app%20bar/app_bar_widget.dart';
import 'package:jatri_app/src/widgets/drop_point_widget.dart';
import 'package:jatri_app/src/widgets/history_time_widget.dart';
import 'package:jatri_app/src/widgets/pick_up_location_widget.dart';
import 'package:jatri_app/src/widgets/status_widget.dart';
import 'package:jatri_app/src/widgets/text/custom_text_filed_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class ReturnTripBidNowPage extends StatefulWidget {
  final String pickDivision;
  final String dropDivision;
  final String partnerBidId;
  final String partnerFare;
  final String carName;
  final String carImg;
  final String capacity;
  final String tripTime;
  final dynamic partnerId;

  ReturnTripBidNowPage({
    Key? key,
    required this.pickDivision,
    required this.dropDivision,
    required this.partnerBidId,
    required this.partnerFare,
    required this.carName,
    required this.carImg,
    required this.capacity,
    required this.tripTime,
    this.partnerId,
  }) : super(key: key);

  @override
  State<ReturnTripBidNowPage> createState() => ReturnTripBidNowPageState();
}

class ReturnTripBidNowPageState extends State<ReturnTripBidNowPage> {
  final divisionController = TextEditingController();
  final locationController = TextEditingController();
  final customerFareController = TextEditingController();
  final RxString totalFare = ''.obs;
  int maxWords = 6;

  final ReturnTripConfirmController _controller =
      Get.put(ReturnTripConfirmController());

  final LocationController _locationController = Get.put(LocationController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AllTripHistoryController controller =
      Get.put(AllTripHistoryController());
  String?formattedDate;
  String?time;
  @override
  void initState() {
    super.initState();
    updateTotalFare();
    var inputText=widget.tripTime.toString();
    List<String> parts = inputText.split(' ');
    String date = parts[0];
     time = parts[1] + ' ' + parts[2];

    // Split the date into day, month, year
    List<String> dateParts = date.split('-');
     formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
  }

  void updateTotalFare() {
    double totalFareValue = double.tryParse(customerFareController.text) ?? 0;
    totalFare.value = totalFareValue.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      drawer: Drawer(
        child: ExampleSidebarX(
          controller: controller.sidebarController,
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
        onTap: (){
      Get.back();
    },
    child: Icon(Icons.arrow_back)),
    title: KText(text: 'bid',color: white,fontWeight: FontWeight.bold,fontSize: 17,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Pick-up and Drop-off Location',
              //   style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 10),
              Center(
                child: CustomPaint(
                  painter: DrawDottedhorizontalline(),
                ),
              ),
              // Container(
              //   width: Get.width,
              //   color: white,
              //   child: Padding(
              //     padding: paddingH10V20,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Column(
              //           children: [
              //             CircleAvatar(
              //               backgroundColor: primaryColor,
              //               radius: 10,
              //             ),
              //             sizeH5,
              //             Container(
              //               height: 120,
              //               width: .5,
              //               color: black,
              //             ),
              //             sizeH5,
              //             Container(
              //               height: 18,
              //               width: 18,
              //               color: Colors.blue,
              //             ),
              //           ],
              //         ),
              //         sizeW20,
              //         Expanded(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               KText(
              //                 text: 'pickUpPoint',
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //               sizeH5,
              //               // Pass divisionController to PickUp widget
              //               PickUp(),
              //               sizeH10,
              //               KText(
              //                 text: 'dropOffPoint',
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //               sizeH5,
              //               // Pass locationController to DropWidget widget
              //               DropWidget(),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 10.h),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Pick-up Location',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/pick.png",
                        scale: 15,
                      ),
                      SizedBox(
                        width: Get.width/1.2,
                        child: KText(
                          text:
                              truncateTextIfNeeded(widget.pickDivision, maxWords),
                        ),
                      )
                    ],
                  ),
                  sizeH5,
                  sizeH10,
                  Text(
                    'Drop-off Location',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/map.png",
                        scale: 15,
                      ),
                      SizedBox(
                        width: Get.width/1.2,
                        child: KText(
                          text:
                              truncateTextIfNeeded(widget.dropDivision, maxWords),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              sizeH5,
              sizeH5,
              CustomTextFieldWithIcon(
                label: "Your Fare:",
                icon: Icons.business,
                controller: customerFareController,
                hinttext: "Enter Your Fare",
                onChanged: (value) {
                  updateTotalFare();
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(
                    text: 'Total Fare',
                    fontWeight: FontWeight.bold,
                  ),
                  Obx(() => KText(
                        text: "${totalFare.value} Tk",
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(height: 10),
              CarContainerWidget(
                img: Urls.getImageURL(endPoint: widget.carImg),
                carName: widget.carName,
                capacity: "${widget.capacity} Seats Capacity",
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  StatusWidget(
                    icon: Icons.watch_later_outlined,
                    statusTitle: 'Trip Time',
                    textColor: Colors.black,
                  ),
                  Spacer(),
                  HistoryTimeWidget(
                    date: "$formattedDate $time",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: primaryButton(
                  icon: Icons.arrow_circle_right_outlined,
                  buttonName: 'Bid Now',
                  onTap: () async {
                    log("${_locationController.pickUpLocation.toString()}");
                    log("${_locationController.dropLocation.toString()}");
                    String pickupLatAndLang =
                        '${_locationController.selectedPickUpLat} ${_locationController.selectedPickUpLng}';
                    String dropOffLocation =
                        '${_locationController.selectedDropUpLat} ${_locationController.selectedDropUpLng}';

                    if (divisionController.text.isEmpty &&
                        locationController.text.isEmpty &&
                        customerFareController.text.isEmpty) {
                      Get.snackbar(
                        'Sorry',
                        'Your Fare Required',
                        colorText: Colors.white,
                        backgroundColor: Colors.redAccent,
                      );
                    } else {
                      await _controller.returnTripConfirm(
                        pickUpLocation:
                            _locationController.pickUpLocation.toString(),
                        price: customerFareController.text,
                        dropLocation:
                            _locationController.dropLocation.toString(),
                        partnerBidId: widget.partnerBidId,
                        map: pickupLatAndLang,
                        dropOffMap: dropOffLocation,
                        partnerId: widget.partnerId,
                      );
                      if (_controller.customerBid.value.status == "success") {
                        Get.to(() => ReturnBidConfirm(
                              carImg: widget.carImg,
                              capacity: widget.capacity,
                              carName: widget.carName,
                              pickup:widget.pickDivision,
                              drop: widget.dropDivision,
                              partnerFare: widget.partnerFare,
                              tripTime: widget.tripTime,
                              bidId: _controller.customerBid.value.data!.id
                                  .toString(),
                            ));
                      }
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
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

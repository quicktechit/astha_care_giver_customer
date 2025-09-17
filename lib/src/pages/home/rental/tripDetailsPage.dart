import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20request%20controllers/rental_trip__expire_controller.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20request%20controllers/rental_trip_req_submit_controller.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/car%20selected%20option/car_selected_option_widget.dart';
import 'package:jatri_app/src/widgets/custom_drop_and_pickup_point.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class TripDetailsPage extends StatefulWidget {
  final String carImg;
  final String service_id;
  final String carName;
  final String capacity;
  final String carId;
  final String pickUpPoint;
  final String dropPoint;
  final String viaPoint;
  final String note;
  final String roundTrip;
  final bool monthly;
  final bool weekly;
  final bool hourly;
  final String age;
  final String name;
  final String gender;
  final String tripDetailsJourney;
  final String map;
  final String weeklyTime;
  final String monthlyTime;
  final String dropOffMap;
  final String roundTripDetailsJourney;

  TripDetailsPage(
      {required this.carImg,
      required this.carName,
      required this.capacity,
      required this.carId,
      required this.weeklyTime,
      required this.hourly,
      required this.monthlyTime,
      required this.pickUpPoint,
      required this.dropPoint,
      required this.viaPoint,
      required this.tripDetailsJourney,
      required this.roundTrip,
      required this.map,
      required this.monthly,
      required this.weekly,
      required this.age,
      required this.name,
      required this.gender,
      required this.roundTripDetailsJourney,
      required this.dropOffMap,
      required this.service_id,
      required this.note, });

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  final TextEditingController addPromoController = TextEditingController();
  final RentalTripSubmitController _controller =
      Get.put(RentalTripSubmitController());




  String promoCode = '';
  String? formattedDate;
  String? time;
  @override
  void initState() {
    var inputText=widget.tripDetailsJourney.toString();
    List<String> parts = inputText.split(' ');
    String date = parts[0];
    time = parts[1] + ' ' + parts[2];

    // Split the date into day, month, year
    List<String> dateParts = date.split('-');
    formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';

    Future.delayed(Duration(hours: 1), () {
      RentalTripExpireController()
          .expireTripMethod(tripId: _controller.tripBid.toInt());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 100,
        color: white,
        child: Padding(
          padding: paddingH20V20,
          child: primaryButton(
            buttonName: 'Send Request',
            onTap: () async {
              await _controller.rentalFormSubmit(
                pickUpLocation: widget.pickUpPoint,
                viaLocation: widget.viaPoint,
                dropLocation: widget.dropPoint,
                dateTime: widget.tripDetailsJourney,
                map: widget.map,
                roundTrip: widget.roundTrip,
                promoCode: promoCode,
                roundTripTimeDate: widget.roundTripDetailsJourney,
                vehicleId: widget.carId,
                dropMap: widget.dropOffMap,
                service_id: widget.service_id,
                note: widget.note,
              );

            },
          ),
        ),
      ),
      backgroundColor: bgColor,
      appBar: AppBar(

        title: Text(
          "Service Details",
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
      ),
      body: ListView(
        children: [
          CarSelectedOption(
              carImg: widget.carImg,
              carName: widget.carName,
              // capacity: "${widget.capacity} Day"
          ),
          sizeH5,
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(text: "User Information"),
              sizeH10,
              Row(children: [
                Icon(Icons.person_outline),
                sizeW5,
                KText(text: widget.name.toString(),fontSize: 15,fontWeight: FontWeight.bold,)
              ],),
              sizeH10,
              Row(children: [
                Icon(Icons.transgender),
                sizeW5,
                KText(text: widget.gender),
                sizeW40,
                KText(text: 'Age',fontWeight: FontWeight.bold,),
                sizeW5,
                KText(text:widget.age)
              ],),
              sizeH10,
              KText(text: "Note",fontWeight: FontWeight.bold,),
              sizeH10,
              KText(text: widget.note)
            ],),
            
          ),
          sizeH5,
          DropAndPickupWidget(
            dropPoint: widget.dropPoint,
            viaPoint: widget.viaPoint,
            pickPoint: widget.pickUpPoint,
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Hourly',
                        fontSize: 12,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                      sizeH5,
                      KText(
                        text: widget.hourly == false ? 'No' : 'Yes',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Daily',
                        fontSize: 12,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                      sizeH5,
                      KText(
                        text: widget.roundTrip == "0" ? 'No' : 'Yes',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Weekly',
                        fontSize: 12,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                      sizeH5,
                      KText(
                        text: widget.weekly==false? 'No' : 'Yes',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: 'Monthly',
                        fontSize: 12,
                        color: black45,
                        fontWeight: FontWeight.w600,
                      ),
                      sizeH5,
                      KText(
                        text: widget.monthly == false ? 'No' : 'Yes',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ],
              ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: 'Service Date',
                    fontSize: 12,
                    color: black45,
                    fontWeight: FontWeight.w600,
                  ),
                  sizeH5,
                  KText(
                    text: '$formattedDate $time',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
          // sizeH5,
          // Container(
          //   color: white,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 10,
          //       vertical: 15,
          //     ),
          //     child: Row(
          //       children: [
          //         KText(
          //           text: 'noPromoAdded',
          //           fontSize: 12,
          //           color: black54,
          //           fontWeight: FontWeight.w600,
          //         ),
          //         Spacer(),
          //         GestureDetector(
          //           onTap: () {
          //             showDialog(
          //               context: context,
          //               builder: (BuildContext context) {
          //                 return AlertDialog(
          //                   title: Text('Add Promo Code'),
          //                   content: Container(
          //                     width: 300.w,
          //                     height: 100,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       crossAxisAlignment: CrossAxisAlignment.center,
          //                       children: [
          //                         CustomTextFieldWithIcon(
          //                           label: 'Add Promo',
          //                           icon: Icons.password,
          //                           controller: addPromoController,
          //                           hinttext: "Promo Code ",
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   actions: [
          //                     ElevatedButton(
          //                       onPressed: () {
          //                         Navigator.of(context).pop();
          //                       },
          //                       child: Text('Close'),
          //                     ),
          //                     ElevatedButton(
          //                       onPressed: () {
          //                         setState(() {
          //                           promoCode = addPromoController.text;
          //                         });
          //                         Navigator.of(context).pop();
          //                       },
          //                       child: Text('Apply'),
          //                     ),
          //                   ],
          //                 );
          //               },
          //             );
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.blue.shade50,
          //               borderRadius: BorderRadius.circular(30),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(
          //                 horizontal: 10,
          //                 vertical: 5,
          //               ),
          //               child: Row(
          //                 children: [
          //                   Icon(
          //                     Icons.add,
          //                     size: 20,
          //                     color: Colors.blue,
          //                   ),
          //                   KText(
          //                     text: 'addPromoCode',
          //                     fontWeight: FontWeight.w600,
          //                     fontSize: 14,
          //                     color: Colors.blue,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

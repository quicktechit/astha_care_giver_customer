import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/components/drawer/sidebarComponent.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/return%20trip%20controller/return_bid_cancel_controller.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/widgets/border_background_button.dart';
import 'package:jatri_app/src/widgets/car_container_widget.dart';
import 'package:jatri_app/src/widgets/custom%20app%20bar/app_bar_widget.dart';
import 'package:jatri_app/src/widgets/history_time_widget.dart';
import 'package:jatri_app/src/widgets/partner_fee_widget.dart';
import 'package:jatri_app/src/widgets/status_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class ReturnBidConfirm extends StatefulWidget {
  final String carImg;

  final String capacity;
  final dynamic bidId;
  final String carName;
  final String pickup;
  final String drop;
  final String partnerFare;
  final String tripTime;

  const ReturnBidConfirm(
      {super.key,
      required this.carImg,
      required this.capacity,
      required this.carName,
      required this.pickup,
      required this.drop,
      required this.partnerFare,
      required this.tripTime,
      this.bidId});

  @override
  State<ReturnBidConfirm> createState() => _ReturnBidConfirmState();
}

class _ReturnBidConfirmState extends State<ReturnBidConfirm> {
  final ReturnTripBidCancelController _controller =
      Get.put(ReturnTripBidCancelController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AllTripHistoryController controller =
      Get.put(AllTripHistoryController());

String? formattedDate;
String? time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var inputText=widget.tripTime.toString();
    List<String> parts = inputText.split(' ');
    String date = parts[0];
     time = parts[1] + ' ' + parts[2];

    // Split the date into day, month, year
    List<String> dateParts = date.split('-');
     formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
  }
  Future<bool> _onBackPressed() async {
    Get.offAll(DashboardView(), transition: Transition.fadeIn);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
               _onBackPressed();
              },
              child: Icon(Icons.arrow_back)),
          title: KText(text: 'bidconfirm',color: white,fontWeight: FontWeight.bold,fontSize: 17,),),
        body: Container(
          width: Get.width,
          child: Padding(
            padding: paddingH10V20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusWidget(
                        bgColors: Colors.grey.withOpacity(0.2),
                        icon: Icons.edit_location_sharp,
                        statusTitle: widget.pickup,
                        textColor: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0.h),
                        child: Container(
                          height: 30,
                          width: 1.4,
                          color: Colors.red,
                        ),
                      ),
                      StatusWidget(
                        bgColors: Colors.grey.withOpacity(0.2),
                        icon: Icons.edit_location_rounded,
                        statusTitle: widget.drop,
                        textColor: Colors.black,
                      ),
                      sizeH20,
                      CarContainerWidget(
                        img: Urls.getImageURL(endPoint: widget.carImg),
                        carName: widget.carName,
                        capacity: '${widget.capacity} Seats Capacity',
                      ),
                      sizeH20,
                      Row(
                        children: [
                          StatusWidget(
                            icon: Icons.watch_later_outlined,
                            statusTitle: 'Trip Time',
                            textColor: Colors.black,
                          ),
                          Spacer(),
                          HistoryTimeWidget(
                            date: '$formattedDate $time',
                          )
                        ],
                      ),
                      Divider(),
                      PartnerFeeWidget(
                        partnerFee: "${widget.partnerFare} TK",
                      ),
                      sizeH20,
                      sizeH20,
                      Obx(
                        () => _controller.isLoading.value
                            ? loader()
                            : Container(
                                child: primaryBorderButton(
                                    icon: Icons.cancel_outlined,
                                    buttonName: 'Cancel Bid',
                                    onTap: () {
                                      _controller.cancelBid(bidId: int.parse(widget.bidId));
                                    }),
                              ),
                      ),
                      20.verticalSpace,
                      Center(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.blue,
                          borderRadius: BorderRadius.circular(17)
                          ),
                          width: Get.width/1.1,
                          alignment: Alignment.center,
                          child: TextButton(onPressed: (){
                            Get.to(()=>DashboardView());
                          }, child: KText(text: 'Go back to Home',fontWeight: FontWeight.bold,))
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

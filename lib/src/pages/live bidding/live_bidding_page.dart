import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/empty_box_widget.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/live%20bidding%20controller/live_bidding_controller.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20request%20controllers/rental_trip_bid_confirm_controller.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20request%20controllers/rental_trip_req_submit_controller.dart';
import 'package:jatri_app/src/controllers/single%20trip%20details%20controller/single_trip_details_controller.dart';
import 'package:jatri_app/src/controllers/trip_expired_sms/trip_expired_controller.dart';
import 'package:jatri_app/src/models/live_bidding_model.dart';
import 'package:jatri_app/src/pages/live%20bidding/bidding_confirm_screen.dart';
import 'package:jatri_app/src/widgets/car_live_bidding_widget.dart';
import 'package:jatri_app/src/widgets/divider_widget.dart';
import 'package:jatri_app/src/widgets/slider/slider_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/common_controller.dart';
import '../../controllers/fixed_trip/fix_trip_controller.dart';
import '../../widgets/text/kText.dart';

class LiveBiddingPage extends StatefulWidget {
  const LiveBiddingPage({Key? key}) : super(key: key);

  @override
  State<LiveBiddingPage> createState() => _LiveBiddingPageState();
}

class _LiveBiddingPageState extends State<LiveBiddingPage>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  bool _timerRunning = false;
  Duration _remainingTime = const Duration(hours: 1);
  DateTime? _startTime;
  int? selectedCarIndex;

  late StreamController<Duration> _timerStreamController;
  late Timer _timer;

  final box = GetStorage();

  final LiveBiddingController liveBiddingController = Get.put(LiveBiddingController());
  final SingleTripDetailsController _singleTripC = Get.put(SingleTripDetailsController());
  final RentalTripSubmitController _rentalTripSubmitController = Get.put(RentalTripSubmitController());
  final QuickTechFixedTripController fixedTripController = Get.put(QuickTechFixedTripController());

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    _controller!.repeat();

    _timerStreamController = StreamController<Duration>();
    _loadStartTime();
    _startDataRefreshTimer();
  }

  void _loadStartTime() async {
    final prefs = await SharedPreferences.getInstance();
    final storedStartTime = prefs.getInt('timer_start_time');

    if (storedStartTime != null) {
      _startTime = DateTime.fromMillisecondsSinceEpoch(storedStartTime);
    } else {
      _startTime = DateTime.now();
      await prefs.setInt('timer_start_time', _startTime!.millisecondsSinceEpoch);
    }

    final elapsed = DateTime.now().difference(_startTime!);
    final totalDuration = const Duration(hours: 1);
    _remainingTime = totalDuration - elapsed;

    if (_remainingTime.isNegative) {
      _remainingTime = Duration.zero;
    }

    _timerStreamController.add(_remainingTime);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingTime.inSeconds > 0) {
        _remainingTime -= const Duration(seconds: 1);
        _timerStreamController.add(_remainingTime);
      } else {
        _timer.cancel();
        _timerStreamController.add(Duration.zero);
      }
    });
  }

  void _startDataRefreshTimer() {
    if (!_timerRunning) {
      Timer.periodic(const Duration(seconds: 10), (timer) {
        liveBiddingController.getLiveBid();
      });
      _timerRunning = true;
    }
  }
  @override
  void dispose() {
    _controller?.dispose();
    _timer.cancel();
    _timerStreamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Live Bidding",
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<Duration>(
              stream: _timerStreamController.stream,
              initialData: _remainingTime,
              builder: (context, snapshot) {
                final remainingTime = snapshot.data!;
                debugPrint('Remaining Time ::: ${remainingTime}');
                return Text(
                  '${_formatDuration(remainingTime)}',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              minHeight: 10,
              backgroundColor: primaryColor50,
              value: _controller!.value,
            ),
            Expanded(
              child: Obx(() {
                if (liveBiddingController.isLoading.value) {
                  return loader();
                } else if (liveBiddingController.liveBidData.isEmpty) {
                  return EmptyBoxWidget(
                      title: "Searching for a driver near you\nplease wait a moment....");
                } else {
                  return ListView.builder(
                    itemCount: liveBiddingController.liveBidData.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected = selectedCarIndex == index;
                      final LiveBidData data =
                          liveBiddingController.liveBidData[index];
                      return GestureDetector(
                        onTap: () {
                          _singleTripC
                              .singleTripDetails(data.tripId.toString());
                          setState(() {
                            selectedCarIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: isSelected
                                ? Border.all(
                                    color: Colors.green,
                                    width: 1.5,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarLiveBiddingContainerWidget(
                              img: Urls.getImageURL(
                                  endPoint: data.getpartner?.image.toString()??''),
                              carName: data.getpartner?.name.toString()??'',
                              capacity: 'Fare: ${data.amount.toString()} TK',
                              rating: '',
                              fare: '',
                              carNumber: '',
                              onTap: () {

                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
            Container(
              padding: EdgeInsets.all(16),
              // Adjust the height as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      cancelTripRequestReason(
                        context,
                       box.read("ID").toString(),
                        'req',
                      );
                    },
                    child: Container(
                      width: Get.width / 3,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: maincolor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: KText(
                        text: 'Cancel Service',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (selectedCarIndex != null &&
                          selectedCarIndex! <
                              liveBiddingController.liveBidData.length) {
                        final LiveBidData selectedBidData =
                            liveBiddingController
                                .liveBidData[selectedCarIndex!];

                        final ReturnBidConfirmController confirmController =
                            ReturnBidConfirmController();

                        await confirmController.bidConfirm(
                          bidId: selectedBidData.id.toString(),
                          tripId: selectedBidData.tripId.toString(),
                        );

                        if (confirmController.bidConfirmModel.value.status ==
                            "success") {
                          Get.find<CommonController>().getCustomerStatus(0);
                          _rentalTripSubmitController.liveBidStart.value=false;
                          box.write("liveBidStart",false);
Get.offAll(DashboardView());
                          // Get.to(() => LiveBiddingConfirmScreen(
                          //     rentalBidConfirm: confirmController
                          //           .bidConfirmModel.value.data!,
                          //       id: '${confirmController.bidConfirmModel.value.data?.tripConfirm?.trackingId}',
                          //     ));
                        } else {}
                      }
                    },
                    child: Container(
                      width: Get.width / 3,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: maincolor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: KText(
                        text: 'Continue Service',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            if (selectedCarIndex == null)
              Column(
                children: [
                  DividerWidget(title: "Ongoing Offer"),
                  SizedBox(height: 20.h),
                  SliderWidget(),
                ],
              ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void cancelTripRequestReason(
    BuildContext context,
    String tripId,
    String type,
  ) {
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
                  "Cancel Service?",
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
                            leading: Icon(Icons.medical_services),
                            title: Text(
                              data.title.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              Get.back();
                              fixedTripController.cancelReqTrip(
                                  tripId: tripId, reasonId: data.id.toString());
                            },
                          );
                        }),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Keep my Service"),
                ),
              ],
            ),
          );
        });
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);
    return '$hours hrs $minutes min $seconds sec';
  }

  void _callAPIAfterOneHour() {
    sendTimeExpiredSMS(_rentalTripSubmitController.id.toString());
  }
}

import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/common_controller.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:jatri_app/src/controllers/service%20controller/quick_tech_service_controller.dart';
import 'package:jatri_app/src/pages/home/rental/rentalListPage.dart';
import 'package:jatri_app/src/pages/live%20bidding/live_bidding_page.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/custom%20app%20bar/app_bar_widget.dart';
import 'package:jatri_app/src/widgets/divider_widget.dart';
import 'package:jatri_app/src/widgets/slider/slider_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import '../../configs/appList.dart';
import '../../controllers/fixed_trip/fix_trip_controller.dart';
import '../../controllers/return trip controller/return_filter_controller.dart';
import 'my service/my_service/my_service_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CommonController commonController=Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var box = GetStorage();
  final QuickTechFixedTripController fixedTripController =
      Get.put(QuickTechFixedTripController());
  final HomeController homeController = Get.find();
  final returnTripFilter = Get.put(ReturnTripFilter());
  Future<void> displayLocalNotification(RemoteMessage message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      vibrationPattern: Int64List.fromList([0, 700, 1400, 700, 1400]),
      sound: RawResourceAndroidNotificationSound('sound'),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'Notification ',
      message.notification?.body ?? '',
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }

  @override
  initState() {
    fixedTripController.fetchReasonList();
    super.initState();
    log(box.read("liveBidStatus").toString(), name: "live bid test====>>>");

    homeController.fetchTravelData();
    homeController.fetchOfferData();
    homeController.fetchDriverData();
    homeController.fetchPackageData();
    homeController.fetchPartnerships();
    // _getDeviceToken();

    /// notification catch here in console
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('============Received FCM message: ${message.notification?.body}');
      print('============Received FCM message: ${message.notification?.title}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          'User tapped on the notification when the app was in the background/terminated');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Handle foreground messages
      print('Got a message whilst in the foreground!');
      print('Message dashboard data: ${message.notification?.title}');

      // Display local notification
      await displayLocalNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('Message dashboard data: ${message.notification?.body}');

      await displayLocalNotification(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      // drawer: Drawer(
      //     child: ExampleSidebarX(
      //   controller: _controller,
      // )),
      appBar: CustomCommonAppBar(
        title: 'Customer App',
        scaffoldKey: _scaffoldKey,
      ),
      // floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 50),
      //   child: ExpandableFab(
      //     openButtonBuilder: RotateFloatingActionButtonBuilder(
      //       child: Image.asset(
      //         'assets/animations/whatsapp.png',
      //         width: 40,
      //       ),
      //       fabSize: ExpandableFabSize.regular,
      //       foregroundColor: Colors.white,
      //       backgroundColor: Colors.green,
      //       shape: const CircleBorder(),
      //     ),
      //     closeButtonBuilder: DefaultFloatingActionButtonBuilder(
      //       child: const Icon(Icons.close),
      //       fabSize: ExpandableFabSize.regular,
      //       foregroundColor: Colors.red,
      //       backgroundColor: Colors.white,
      //       shape: const CircleBorder(),
      //     ),
      //     overlayStyle: ExpandableFabOverlayStyle(
      //       color: Colors.white.withOpacity(0.8),
      //       blur: 2.0,
      //     ),
      //     type: ExpandableFabType.up,
      //     distance: 50,
      //     key: _key,
      //     children: [
      //       SizedBox(),
      //       Row(
      //         children: [
      //           Text(
      //             'Message(WhatsApp)',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(width: 20),
      //           FloatingActionButton.small(
      //             heroTag: null,
      //             onPressed: () async {
      //               String contact = "";
      //               String text = 'hi';
      //               final String encodedMessage = Uri.encodeComponent(
      //                   text);
      //               final Uri uri = Uri.parse('https://wa.me/$contact?text=$encodedMessage');
      //               if (!await launchUrl(
      //                 uri,
      //                 mode: LaunchMode.externalApplication,
      //               )) {
      //                 throw Exception('Could not launch $uri');
      //               }
      //             },
      //             child: Icon(Icons.message_outlined),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text(
      //             'Message(Facebook)',
      //             style: TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(width: 20),
      //           FloatingActionButton.small(
      //             heroTag: null,
      //             onPressed: () async {
      //               final Uri url = Uri.parse(
      //                   '');
      //               if (!await launchUrl(url)) {
      //                 throw Exception('Could not launch $url');
      //               }
      //             },
      //             child: Icon(Icons.send_outlined),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: paddingH20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeH10,
            SliderWidget(),
            sizeH20,
            Obx(() {
              if(commonController.data.value.data?.status==1){
                return  primaryButton(buttonName: "You Have an Ongoing Service", onTap: (){
                  Get.to(()=>LiveBiddingPage());
                }).animate(
                  onPlay: (controller) => controller.repeat(),
                ).shimmer(
                  color: Colors.white60,
                  delay: Duration(milliseconds: 600), duration:700.ms,);
              }else{
                return SizedBox.shrink();
              }

            }),



            sizeH10,

            DividerWidget(title: "Choose Your Vehicle"),
            SizedBox(height: 10.h),
            /// desire section
            Column(
              children: [
                // First row: 3 cards

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    _buildCard(context, 0, gridImageList, gridTitleList,Get.width/2.5,),
                    SizedBox(width: 5), // Horizontal spacing
                    _buildCard(context, 1, gridImageList, gridTitleList,Get.width/2.5),
                    // SizedBox(width: 5), // Horizontal spacing
                    // _buildCard(context, 2, gridImageList, gridTitleList,null),

                  ],
                ),
                // SizedBox(height: 5), // Vertical spacing between rows
                // // Second row: 2 cards, no extra space
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     _buildCard(context, 3, gridImageList, gridTitleList,Get.width/2.495),
                //     SizedBox(width: 5), // Horizontal spacing
                //     _buildCard(context, 4, gridImageList, gridTitleList,Get.width/2.495),
                //   ],
                // ),
              ],
            ),

            15.verticalSpace,
            // DividerWidget(title: "Others Services & Offers"),
            // SizedBox(height: 10.h),
            // GridView.builder(
            //     padding: EdgeInsets.symmetric(vertical: 0),
            //     itemCount: gridTitleList2.length,
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisSpacing: 8,
            //       mainAxisSpacing: 8,
            //       childAspectRatio: 1.4,
            //       crossAxisCount: 2,
            //     ),
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           switch (index) {
            //             case 0:
            //               Get.to(() => TouristBus());
            //               break;
            //             case 1:
            //               Get.to(() => SuvCars());
            //
            //               break;
            //             case 2:
            //               Get.to(() => SpacialOffer());
            //               break;
            //             case 3:
            //               Get.to(() => TodayOffer());
            //               break;
            //             case 4:
            //             case 5:
            //             case 6:
            //             case 7:
            //               final customPrograms = {
            //                 4: homeController.weddingProgram,
            //                 5: homeController.ambulance,
            //                 6: homeController.officePick,
            //                 7: homeController.carMonthlyRant,
            //               };
            //               Get.to(() => PackageScreen(
            //                     name: gridTitleList2[index],
            //                     customeProgram: customPrograms[index] ?? [],
            //                   ));
            //               break;
            //             case 8:
            //               Get.to(() => DriverSupply());
            //               break;
            //             case 9:
            //               Get.to(() => DriverTraining());
            //               break;
            //           }
            //         },
            //         child: Container(
            //           clipBehavior: Clip.antiAlias,
            //           decoration: BoxDecoration(
            //               color: Colors.grey.withOpacity(0.2),
            //               borderRadius: BorderRadius.circular(10)),
            //           child: Column(
            //             children: [
            //               Container(
            //                   clipBehavior: Clip.antiAlias,
            //                   decoration: BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.circular(10)),
            //                   child: Image.asset(
            //                     gridImageList2[index],
            //                     width: 200,
            //                     height: 81,
            //                     fit: BoxFit.cover,
            //                   )),
            //               Spacer(),
            //               KText(
            //                 text: gridTitleList2[index],
            //                 textAlign: TextAlign.center,
            //                 fontSize: 13,
            //                 fontWeight: FontWeight.w800,
            //               ),
            //               Spacer(),
            //             ],
            //           ),
            //         ),
            //       );
            //     }),
            20.verticalSpace,
            DividerWidget(title: "Partnership With"),
            10.verticalSpace,
            Obx(
                  () {
                final partnershipData = homeController.partnership.value.data;

                if (partnershipData != null && partnershipData.isNotEmpty) {
                  return CarouselSlider.builder(
                    itemCount: partnershipData.length,
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 1,
                      pageSnapping: true,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0.r),
                          child: Image.asset(
                            "assets/icons/flat-nurse.png",
                            filterQuality: FilterQuality.high,
                            // '${Urls.getImageURL(endPoint: "${partnershipData[index].image}")}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),

            60.verticalSpace,
          ],
        ),
      ),
    );
  }
  final serviceController = Get.put(QuickTechServiceController());
  Widget _buildCard(
      BuildContext context, int index, List<String> imageList, List<String> titleList,width) {
    return GestureDetector(
      onTap: () async {
        log("0dfdfdf");

        switch (index) {
          case 0:
            await serviceController.getServices();
            Get.to(() => RentalListPage(
              id: '1',
                  isAirport: false,
                  isAmbulance: false,
                  isBus: false,
              isSuv: false,
              isTruck: false,
            ));
            break;
          case 1:
          Get.to(() => MyServicePage());
          // Get.to(() => ReturnTripListFilterPage());
          // await returnTripFilter.returnTripFilterList(
          //   pickUpLocation: '',
          //   carId: '',
          //   dropLocation: '',
          // );

            // Get.to(() => RentalListPage(
            //   id: '1',
            //   isAirport: true,
            //   isAmbulance: false,
            //   isBus: false,
            //   isSuv: false,
            //   isTruck: false,
            // ));
            break;

          case 2:
            Get.to(() => RentalListPage(
              id: '1',
              isAirport: true,
              isAmbulance: false,
              isBus: false,
              isSuv: false,
              isTruck: false,
            ));
            // Get.to(() => ReturnTripListFilterPage());
            // await returnTripFilter.returnTripFilterList(
            //   pickUpLocation: '',
            //   carId: '',
            //   dropLocation: '',
            // );
            break;

          case 3:
            Get.to(() => RentalListPage(
              id: '8',
              isAirport: false,
              isAmbulance: false,
              isBus: false,
              isSuv: false,
              isTruck: true,
            ));
            break;

          case 4:
            Get.to(() => RentalListPage(
              id: '6',
              isAirport: false,
              isAmbulance: true,
              isBus: false,
              isSuv: false,
              isTruck: false,
            ));
            break;
        }
      },
      child: Container(
        height: 95,
       decoration: BoxDecoration( color: Colors.grey.withOpacity(0.2),borderRadius: BorderRadius.circular(10)),
        width: width??null,// Fixed height for card
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                imageList[index],
                width: 75,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            KText(
              text: titleList[index],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }

}

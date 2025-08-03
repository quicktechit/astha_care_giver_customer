import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../configs/appBaseUrls.dart';
import '../../../configs/appColors.dart';
import '../../../configs/appUtils.dart';
import '../../../widgets/text/kText.dart';
import '../../search/controller/searchController.dart';
import 'bid_now_page.dart';

class AllReturnTripListPage extends StatefulWidget {
  const AllReturnTripListPage({super.key});

  @override
  State<AllReturnTripListPage> createState() => _AllReturnTripListPageState();
}

class _AllReturnTripListPageState extends State<AllReturnTripListPage> {
  final SearchControllers controller = Get.put(SearchControllers());


  @override
  void initState() {
    // TODO: implement initState
    controller.fetchList(name: '');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          "Round Trip".tr,
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
      ),
      body:  SafeArea(
        child:  Obx(() {
          if (controller.isLoading.value) {
            return Center(
                child:
                CircularProgressIndicator()); // Show loading spinner
          }

          if (controller.searchModel.value == null) {
            return Center(child: Text(
                'No Trip Request available.'));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.tripRwq.length,
            itemBuilder: (context, index) {
              var item = controller.tripRwq[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: CustomCardWidget(
                  color: white,
                  radius: 10,
                  child: Padding(
                    padding: paddingH10V10,
                    child: Column(
                      children: [
                        rawText(
                            title: 'ট্রিপের সময়',
                            content: item.timedate),
                        sizeH10,
                        DotDividerWidget(
                          fillRate: .5,
                        ),
                        sizeH10,
                        SizedBox(
                          height: 110.h,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  sizeH5,
                                  Image.asset(
                                    "assets/images/pick.png",
                                    scale: 20,
                                  ),
                                  sizeH5,
                                  Container(
                                    height: 30,
                                    width: .7,
                                    color: grey,
                                  ),
                                  sizeH5,
                                  Image.asset(
                                    "assets/images/map.png",
                                    scale: 20,
                                  ),
                                  // CircleAvatar(
                                  //   radius: 6,
                                  //   backgroundColor: primaryColor,
                                  // ),
                                ],
                              ),
                              sizeW5,
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'পিকআপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        width: Get.width / 2,
                                        child: KText(
                                          text:
                                          item.location.toString(),
                                          fontWeight: FontWeight
                                              .bold,
                                          fontSize: 14,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //  Spacer(),

                                  sizeH10,
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'ড্রপ লোকেশন: ',
                                        color: black54,
                                        fontSize: 14,
                                      ),
                                      // sizeW5,
                                      Container(
                                        height: 35,
                                        width: Get.width / 2,
                                        // color: primaryColor,
                                        child: KText(
                                          text: item.destination
                                              .toString(),
                                          fontSize: 14,
                                          fontWeight: FontWeight
                                              .bold,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              sizeW10,
                              Column(
                                children: [
                                  Container(
                                    height: 65,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle),
                                    child: Image.network(
                                      Urls.getImageURL(
                                        endPoint: item.getvehicle
                                            ?.image.toString() ??
                                            '',
                                      ),
                                      width: 30,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  sizeW5,
                                  KText(
                                    text:
                                    '${item.getvehicle
                                        ?.name} | \n${item
                                        .getvehicle
                                        ?.capacity} Seats',
                                    fontSize: 13,
                                    color: black,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        DotDividerWidget(
                          fillRate: .5,
                        ),
                        sizeH10,
                        GestureDetector(
                          onTap: () {

                            log('pickDivision: ${item.location
                                .toString() }  dropDivision: ${item
                                .destination.toString()}');
                            Get.to(() =>
                                ReturnTripBidNowPage(
                                  partnerId: item.partnerId
                                      .toString(),
                                  pickDivision: item.location
                                      .toString(),
                                  dropDivision: item.destination
                                      .toString(),
                                  partnerBidId: item.id.toString(),
                                  partnerFare: item.amount
                                      .toString(),
                                  carName: item.getvehicle?.name
                                      .toString() ?? '',
                                  carImg: item.getvehicle?.image
                                      .toString() ?? '',
                                  capacity:
                                  item.getvehicle?.capacity
                                      .toString()??'',
                                  tripTime: item.timedate
                                      .toString(),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: Get.width,
                            height: 38.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    12),
                                color: maincolor),
                            child: KText(text: "Bid Now",
                              color: Colors.white,),
                          ),
                        )
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Column(
                        //       mainAxisAlignment:
                        //           MainAxisAlignment.start,
                        //       crossAxisAlignment:
                        //           CrossAxisAlignment.start,
                        //       children: [
                        //         KText(
                        //           text:
                        //               item.getpartner?.name.toString()??'',
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //         KText(
                        //           text:
                        //               item.getpartner?.phone.toString()??'',
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ],
                        //     ),
                        //     GestureDetector(
                        //       onTap: () async {
                        //         final Uri uri = Uri(
                        //             scheme: 'tel',
                        //             path: item.getpartner?.phone
                        //                 .toString());
                        //
                        //         await launchUrl(uri,
                        //             mode:
                        //                 LaunchMode.externalApplication);
                        //       },
                        //       child: Container(
                        //           padding: EdgeInsets.all(10),
                        //           decoration: BoxDecoration(
                        //               borderRadius:
                        //                   BorderRadius.circular(50),
                        //               color: maincolor),
                        //           child: Icon(
                        //             Icons.call,
                        //             color: Colors.white,
                        //           )),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        })
      )
    );


  }
  rawText({
    required title,
    required content,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: title == null ? '' : '$title:',
            fontSize: 14,
            // color: black45,
          ),
          // title == null ? sizeH10 : sizeW10,
          Spacer(),
          KText(
            text: content,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ],
      );
}

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final double? elevation;
  final double? height;
  final double? width;
  final double? borderWidth;

  final bool? isRadiusOff;

  final void Function()? onTap;

  final Color? color;
  final Color? borderColor;

  final double radius;

  final bool? isPaddingHide;

  CustomCardWidget({
    required this.radius,
    required this.child,
    this.elevation,
    this.height,
    this.width,
    this.borderWidth,
    this.onTap,
    this.isRadiusOff,
    this.color,
    this.borderColor,
    this.isPaddingHide,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: .5,
      margin: EdgeInsets.all(0),
      elevation: elevation == null ? 2 : elevation,
      shape: isRadiusOff == true
          ? null
          : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: borderColor ?? black45,
              width: borderWidth ?? 1.5,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: isPaddingHide == true ? EdgeInsets.zero : paddingH10V10,
            child: child,
          ),
        ),
      ),
    );
  }
}

class DotDividerWidget extends StatelessWidget {
  final double dashHeight;
  final double dashWith;
  final Color dashColor;
  final double fillRate; // [0, 1] totalDashSpace/totalSpace
  final Axis direction;

  DotDividerWidget({
    this.dashHeight = 1,
    this.dashWith = 4,
    this.dashColor = Colors.grey,
    this.fillRate = 0.5,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxSize = direction == Axis.horizontal
            ? constraints.constrainWidth()
            : constraints.constrainHeight();
        final dCount = (boxSize * fillRate / dashWith).floor();
        return Flex(
          children: List.generate(dCount, (_) {
            return SizedBox(
              width: direction == Axis.horizontal ? dashWith : dashHeight,
              height: direction == Axis.horizontal ? dashHeight : dashWith,
              child: DecoratedBox(
                decoration: BoxDecoration(color: dashColor.withOpacity(.5)),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
        );
      },
    );
  }
}
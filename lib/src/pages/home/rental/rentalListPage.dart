import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/car%20category%20controller/car_category_list_controller.dart';
import 'package:jatri_app/src/controllers/language/langController.dart';
import 'package:jatri_app/src/pages/home/rental/airport_trip.dart';
import 'package:jatri_app/src/pages/home/rental/rentalPointPage.dart';
import 'package:jatri_app/src/widgets/card/customCardWidget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import 'ambulance_trip.dart';

class RentalListPage extends StatefulWidget {
  final String id;
  final bool isAirport;
  final bool isAmbulance;
  final bool isTruck;
  final bool isBus;
  final bool isSuv;

  const RentalListPage(
      {super.key,
      required this.id,
      required this.isAirport,
      required this.isAmbulance,
      required this.isBus,
      required this.isSuv,
      required this.isTruck});

  @override
  State<RentalListPage> createState() => _RentalListPageState();
}

class _RentalListPageState extends State<RentalListPage> {
  final CarCategoryController carCategoryController =
      Get.put(CarCategoryController());
  final LangController langController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carCategoryController.getCarList(widget.id);
      log(widget.id.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          widget.isAirport == true
              ? 'AirPort Trip'.tr
              : widget.isAmbulance == true
                  ? 'ambulance'.tr
                  : widget.isTruck == true
                      ? "selectTruck".tr
                      : "rentalTrip".tr,
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
      ),
      body: Obx(
        () {
          if (carCategoryController.isLoading.value) {
            return Center(
              child: loader(),
            );
          } else {
            return Padding(
              padding: paddingH10,
              child: Column(
                children: [
                  sizeH10,
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: carCategoryController.carListData.length,
                      itemBuilder: (c, i) {
                        final item = carCategoryController.carListData[i];
                        return CustomCardWidget(
                          onTap: () {
                            widget.isAirport
                                ? Get.to(
                                    () => AirportPage(
                                      isAirport: true,
                                      carImg: Urls.getImageURL(
                                          endPoint: item.image.toString()),
                                      carName: item.name.toString(),
                                      capacity: item.capacity.toString(),
                                      carId: item.id.toString(),
                                      tripType: 'car',
                                      category_id: widget.id,
                                    ),
                                  )
                                : widget.isAmbulance
                                    ? Get.to(
                                        () => AmbulancePage(
                                          carImg: Urls.getImageURL(
                                              endPoint: item.image.toString()),
                                          carName: item.name.toString(),
                                          capacity: item.capacity.toString(),
                                          carId: item.id.toString(),
                                          category_id: widget.id,
                                        ),
                                      )
                                    : Get.to(
                                        () => RentalPointPage(
                                          carImg: Urls.getImageURL(
                                              endPoint: item.image.toString()),
                                          carName: item.name.toString(),
                                          capacity: item.capacity.toString(),
                                          carId: item.id.toString(),
                                          category_id: widget.id,
                                        ),
                                      );
                          },
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                12.horizontalSpace,
                                Image.network(
                                  Urls.getImageURL(
                                      endPoint: item.image.toString()),
                                  fit: BoxFit.cover,
                                  width: 80.w,
                                ),
                                5.horizontalSpace,
                                Container(
                                  height: 57,
                                  width: 3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: bgColor),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Column(
                                  children: [
                                    KText(
                                      text: langController.selectedLang.value.languageCode == 'en'
                                          ? item.name.toString()
                                          : item.nameBn.toString(),
                                      fontSize: 17,fontWeight: FontWeight.w600,
                                    ),
                                    widget.isTruck == true
                                        ? KText(
                                            text:
                                                "${item.capacity.toString()} Ton Capacity",
                                            fontSize: 13,
                                            color: black54,
                                          )
                                        : KText(
                                            text:
                                                "${item.capacity.toString()} Seats Capacity",
                                            fontSize: 13,
                                            color: black54,
                                          ),
                                  ],
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/car%20category%20controller/car_category_list_controller.dart';
import 'package:jatri_app/src/controllers/language/langController.dart';
import 'package:jatri_app/src/pages/home/rental/rentalPointPage.dart';
import 'package:jatri_app/src/widgets/card/customCardWidget.dart';
import 'package:jatri_app/src/widgets/text/custom_text_filed_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import '../../../configs/appList.dart';

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
  final TecC = TextEditingController();
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
          "All Service",
          // widget.isAirport == true
          //     ? 'AirPort Trip'.tr
          //     : widget.isAmbulance == true
          //         ? 'ambulance'.tr
          //         : widget.isTruck == true
          //             ? "selectTruck".tr
          //             : "rentalTrip".tr,
          style: TextStyle(color: Colors.white, fontSize: 17.h),
        ),
      ),
      body: Column(
        children: [
          CustomTextFieldWithIcon(

              icon: Icons.search,
              controller: TecC,
              hinttext: "search").paddingSymmetric(horizontal: 10),
          Expanded(
            child: Obx(
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
                          child: GridView.builder(
                            padding: const EdgeInsets.only(top: 8),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.2, // Adjust based on layout
                            ),
                            // itemCount: carCategoryController.carListData.length,
                            itemCount: gridTitleList2.length,
                            itemBuilder: (context, i) {
                              // final item = carCategoryController.carListData[i];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => RentalPointPage(
                                      // carImg: Urls.getImageURL(endPoint: item.image.toString()),
                                      carImg: gridImageList[i],
                                      carName: gridTitleList2[i],
                                      capacity: '1',
                                      carId: i.toString(),
                                      category_id: widget.id,
                                    ),
                                  );
                                },
                                child: CustomCardWidget(
                                  height: 100, // You can adjust this
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          // Urls.getImageURL(endPoint: item.image.toString()),
                                          gridImageList[i],
                                          fit: BoxFit.fill,
                                          width: 60,
                                        ),
                                        // SizedBox(width: 5),
                                        // Container(
                                        //   height: 57,
                                        //   width: 3,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(15),
                                        //     color: bgColor,
                                        //   ),
                                        // ),
                                        // SizedBox(width: 5),
                                        KText(
                                          text: gridTitleList2[i],
                                          // text: langController.selectedLang.value.languageCode == 'en'
                                          //     ? item.name.toString()
                                          //     : item.nameBn.toString(),
                                          fontSize: 15,
                                          textAlign: TextAlign.center,
                                          fontWeight: FontWeight.w600,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
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
          ),
        ],
      ),
    );
  }
}

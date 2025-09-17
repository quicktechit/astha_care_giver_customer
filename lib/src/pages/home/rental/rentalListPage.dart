import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/car%20category%20controller/car_category_list_controller.dart';
import 'package:jatri_app/src/controllers/language/langController.dart';
import 'package:jatri_app/src/controllers/service%20controller/quick_tech_service_controller.dart';
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
  final QuickTechServiceController servicesController = Get.find();
/*  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carCategoryController.getCarList(widget.id);
      log(widget.id.toString());
    });

    super.initState();
  }*/

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
              onChanged: (value) {
                servicesController.searchByAgencyType(value);
              },
              controller: TecC,
              hinttext: "Fiend Your Service").paddingSymmetric(horizontal: 10),
          Expanded(
            child: Obx(
              () {
                if (servicesController.isLoading.value) {
                  return Center(
                    child: loader(),
                  );
                } else {
                  return Padding(
                    padding: paddingH10,
                    child: Column(
                      children: [
                        sizeH10,
                        Obx(() => Expanded(
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
                            itemCount: servicesController.filteredList.value.length,
                            itemBuilder: (context, i) {
                              final item = servicesController.filteredList[i];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                        () => RentalPointPage(
                                      carImg: item.image??'',
                                      carName: item.agencyType??'',
                                      capacity: '1',
                                      carId: i.toString(),
                                      service_id: item.id.toString()??''
                                    ),
                                  );
                                },
                                child: CustomCardWidget(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          '${Urls.domain}/${item.image}',
                                          fit: BoxFit.fill,
                                          width: 60,
                                        ),
                                        KText(
                                          text: item.agencyType??'',
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
                        ),)
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

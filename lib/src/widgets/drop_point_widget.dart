import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/live%20location%20controller/live_location_controller.dart';

class DropWidget extends StatefulWidget {
  const DropWidget({super.key});

  @override
  State<DropWidget> createState() => DropWidgetState();
}

class DropWidgetState extends State<DropWidget> {

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: locationController.dropC,
              onChanged: (value) {
                value.isEmpty
                    ? locationController.fetchDropSuggestions("Bangladesh")
                    : locationController.fetchDropSuggestions(value);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Drop  Point',
                  counterText: '',
                  suffixIcon: locationController.dropC.text.trim().isEmpty?null: GestureDetector(
                      onTap: (){
                        locationController.dropC.clear();
                        locationController.suggestionsDrop.clear();
                      },
                      child: Icon(Icons.cancel)),
                  labelStyle: TextStyle(color: black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  fillColor: grey.shade200,
                  filled: true),
            ),
            sizeH10,
            locationController.isLoading.value == true
                ? Center(
                    child: SpinKitDoubleBounce(
                      color: primaryColor,
                      size: 50.0,
                    ),
                  )
                : locationController.suggestionsDrop.isNotEmpty
                    ? SizedBox(
                        height: 130.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: locationController.suggestionsDrop.length,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                locationController
                                    .suggestionsDrop[index].description,
                              ),
                              onTap: () {
                                locationController.dropC.text = locationController
                                    .suggestionsDrop[index].description;
                                locationController.selectDropAddress(
                                    locationController.suggestionsDrop[index]);

                                locationController.suggestionsDrop.clear();
                              },
                            );
                          },
                        ),
                      )
                    : Container(),
          ],
        ));
  }
}

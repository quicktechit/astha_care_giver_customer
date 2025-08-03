import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/live%20location%20controller/live_location_controller.dart';

class PickUp extends StatefulWidget {
  const PickUp({super.key});

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: locationController.pickUpC,
              onChanged: (value) {
                value.isEmpty
                    ? locationController.fetchPickSuggestions("Bangladesh")
                    : locationController.fetchPickSuggestions(value);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Location',
                  prefixIcon:Icon(Icons.location_on_outlined),
                  suffixIcon:  locationController.pickUpC.text.trim().isEmpty?null: GestureDetector(
                      onTap: (){
                        setState(() {
                          locationController.pickUpC.clear();
                        });
                      },
                      child: Icon(Icons.cancel)),
                  counterText: '',
                  labelStyle: TextStyle(color: black54),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  fillColor:grey.shade200,
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
                : locationController.suggestionsPickUp.isNotEmpty
                    ? SizedBox(
                        height: 130.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              locationController.suggestionsPickUp.length,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                locationController
                                    .suggestionsPickUp[index].description,
                              ),
                              onTap: () {
                                locationController.pickUpC.text = locationController
                                    .suggestionsPickUp[index].description;
                                locationController.selectPikUpAddress(
                                    locationController
                                        .suggestionsPickUp[index]);

                                locationController.suggestionsPickUp.clear();
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

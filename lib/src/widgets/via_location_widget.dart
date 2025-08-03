import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/live%20location%20controller/live_location_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
class ViaLocation extends StatefulWidget {
  const ViaLocation({super.key});

  @override
  State<ViaLocation> createState() => _ViaLocationState();
}

class _ViaLocationState extends State<ViaLocation> {

  final TextEditingController viaTextC=TextEditingController();

  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: 'Via Point',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        TextField(
          controller: viaTextC,
          onChanged: (value) {
            value.isEmpty
                ? locationController
                .fetchViaSuggestions("Bangladesh")
                : locationController
                .fetchViaSuggestions(value);
          },
          decoration: InputDecoration(
              fillColor:grey.shade200,
              border: InputBorder.none,
              suffixIcon: viaTextC.text.trim().isEmpty? null: GestureDetector(
                  onTap: (){
                    viaTextC.clear();
                    locationController.suggestionsVia.clear();
                  },
                  child: Icon(Icons.cancel)),
              hintText: 'Via Point',
              counterText: '',
              labelStyle: TextStyle(color: black54),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(5),
                  borderSide: BorderSide.none),

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
            : locationController.suggestionsVia.isNotEmpty
            ? SizedBox(
          height: 130.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: locationController
                .suggestionsVia.length,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  locationController
                      .suggestionsVia[index]
                      .description,
                ),
                onTap: () {
                  viaTextC.text =
                      locationController
                          .suggestionsVia[index]
                          .description;
                  locationController
                      .selectViaAddress(
                      locationController
                          .suggestionsVia[
                      index]);

                  locationController
                      .suggestionsVia
                      .clear();
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

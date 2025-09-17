
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/slider%20controller/slider_controller.dart';

import '../../configs/appList.dart';

class SliderWidget extends StatelessWidget {
  final SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sliderData = controller.sliderData;

      return controller.isLoading.value
          ? Center(child: loader())
          : CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                // if (sliderData.isNotEmpty) {
                //   // print(sliderData);
                //   final SliderData data = sliderData[index];
                //   return Container(
                //     width: Get.width,
                //     alignment: Alignment.center,
                //     padding: EdgeInsets.symmetric(vertical: 0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(10),
                //       child: Image.network(
                //         Urls.getImageURL(endPoint: data.image??''),fit: BoxFit.cover,
                //       ),
                //     ),
                //   );
                // } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        banner[index],
                      ),
                    ),
                  );
                // }
              },
              options: CarouselOptions(
                height: 120,viewportFraction: 1.0,
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
            );
    });
  }
}

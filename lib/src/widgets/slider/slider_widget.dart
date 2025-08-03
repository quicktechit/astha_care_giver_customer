
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/slider%20controller/slider_controller.dart';
import 'package:jatri_app/src/models/slider_model.dart';

class SliderWidget extends StatelessWidget {
  final SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sliderData = controller.sliderData;

      return controller.isLoading.value
          ? Center(child: loader())
          : CarouselSlider.builder(
              itemCount: sliderData.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                if (sliderData.isNotEmpty) {
                  // print(sliderData);
                  final SliderData data = sliderData[index];
                  return Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Urls.getImageURL(endPoint: data.image??''),fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/car3.png',
                      ),
                    ),
                  );
                }
              },
              options: CarouselOptions(
                height: 110,
                viewportFraction: 1,
                pageSnapping: true,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
    });
  }
}

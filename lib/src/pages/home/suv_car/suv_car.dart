import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/appBaseUrls.dart';
import '../../../configs/appColors.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../../widgets/button/primaryButton.dart';

class SuvCars extends StatefulWidget {
  const SuvCars({super.key});

  @override
  State<SuvCars> createState() => _SuvCarsState();
}

class _SuvCarsState extends State<SuvCars> {
  final HomeController homeController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            ()=> SingleChildScrollView(
              child: Column(
                children: [
                  // Top section with the image and title
                  CarouselSlider.builder(
                    itemCount: homeController.suv.value.travelImages?.length,
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      pageSnapping: true,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      enlargeCenterPage:false,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),

                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return  Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                        ),
                        width: double.infinity,
                        child: Image.network(
                          Urls.getImageURL(endPoint: "${homeController.suv.value.travelImages?[index].image}"),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                  // Content section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${homeController.suv.value.title}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${homeController.suv.value.description}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        // Bullet points
                        // Text(
                        //   '• Travel in Style: Experience first-class comfort on your road trip. Turn heads and conquer miles in a stunning luxury car.',
                        //   style: TextStyle(fontSize: 16),
                        // ),
                        // SizedBox(height: 8),
                        // Text(
                        //   '• Top Brands: Choose from Mercedes, Audi, BMW, Land Rover, Nissan, and more. Whatever you like, whenever you want.',
                        //   style: TextStyle(fontSize: 16),
                        // ),
                        // SizedBox(height: 16),
                        // Text(
                        //   'Stress-Free Booking: Your luxury trip is just one call away. Customer service will handle everything.',
                        //   style: TextStyle(fontSize: 16),
                        // ),
                      ],
                    ),
                  ),
                  // Call-to-action button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: maincolor,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () async {
                          final Uri uri = Uri(
                              scheme: 'tel',
                              path:"${homeController.suv.value.phone}");

                          await launchUrl(uri,
                          mode:
                          LaunchMode.externalApplication);
                        },
                        child: Text(
                          'Call us for details: ${homeController.suv.value.phone}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 5,
            top: 25,
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: maincolor,
                child: Icon(Icons.arrow_back,color: white,),
              ),
            ),
          )
        ],
      ));
  }
}

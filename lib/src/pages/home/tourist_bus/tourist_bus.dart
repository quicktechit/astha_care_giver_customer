import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/appColors.dart';

class TouristBus extends StatefulWidget {
  const TouristBus({super.key});

  @override
  State<TouristBus> createState() => _TouristBusState();
}

class _TouristBusState extends State<TouristBus> {
  var image = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2v62m0ZwN8DH1khKC09gfXL3MoYlA0Ub6XwX_2pLglQdqhCSE8R9crv094XLrsEj6bPc&usqp=CAU',
    'https://static.vecteezy.com/system/resources/thumbnails/037/470/116/small/ai-generated-touristic-coach-bus-on-highway-road-intercity-regional-domestic-transportation-driving-urban-modern-tour-traveling-travel-journey-ride-moving-transport-concept-public-comfortable-photo.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/040/171/979/small_2x/ai-generated-luxury-coach-bus-on-highway-at-sunset-road-trip-travel-concept-photo.jpeg'
  ];
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
                  itemCount: homeController.bus.value.travelImages?.length,
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1,
                    pageSnapping: true,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                      ),
                      width: double.infinity,
                      child: Image.network(
                        Urls.getImageURL(endPoint: "${homeController.bus.value.travelImages?[index].image}"),
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
                       "${homeController.bus.value.title}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                       "${homeController.bus.value.description}",
                        style: TextStyle(fontSize: 16),
                      ),
                      // SizedBox(height: 16),
                      // // Bullet points
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
                            path:"${homeController.bus.value.phone}");

                        await launchUrl(uri,
                        mode:
                        LaunchMode.externalApplication);
                      },
                      child: Text(
                        'Call us for details: ${homeController.bus.value.phone}',
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/appColors.dart';
import '../../../models/package_model.dart';

class PackageScreen extends StatelessWidget {
  final String name;
  final List<CustomPackage> customeProgram;

  PackageScreen({
    super.key,
    required this.name,
    required this.customeProgram,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [maincolor, Colors.blue, Colors.black12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                  name.tr,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Choose Your Car !".tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                          itemCount: customeProgram.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = customeProgram[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                height: 400,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  boxShadow: [
                                    BoxShadow(
                                      color: index == 0
                                          ? Colors.blue
                                          : index == 1
                                              ? Colors.greenAccent
                                              : Colors.purpleAccent,
                                      // Shadow color
                                      offset: Offset(-2, -2),
                                      // Shadow position (top left)
                                      blurRadius: 2,
                                      // Shadow blur radius
                                      spreadRadius: 1, // Shadow spread radius
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      12), // Optional: Rounded corners
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: KText(
                                        text: "${item.carName}",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: index == 0
                                            ? Colors.blue
                                            : index == 1
                                                ? Colors.greenAccent
                                                : Colors.purpleAccent,
                                      ),
                                    ),
                                    Divider(
                                        color: index == 0
                                            ? Colors.blue
                                            : index == 1
                                                ? Colors.greenAccent
                                                : Colors.purpleAccent),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CarouselSlider.builder(
                                      itemCount: item.ourpackageImages?.length,
                                      options: CarouselOptions(
                                        height: 180,
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
                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: bgColor,
                                          ),
                                          width: double.infinity,
                                          child: Image.network(
                                            Urls.getImageURL(endPoint: "${item
                                                .ourpackageImages?[index]
                                                .image}"),
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BDT',
                                          style: TextStyle(
                                              color: index == 0
                                                  ? Colors.blue
                                                  : index == 1
                                                      ? Colors.greenAccent
                                                      : Colors.purpleAccent,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                          // style: h1.copyWith(
                                          //     color: index == 0
                                          //         ? Colors.blue
                                          //         : index == 1
                                          //         ? Colors.greenAccent
                                          //         : Colors.purpleAccent),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${item.price}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40),
                                          // style: titleStyle.copyWith(
                                          //     color: Colors.white,
                                          //     fontSize: 44),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        itemCount: item.ourpackageServices
                                            ?.length, itemBuilder:(context,index){
                                        var service=item.ourpackageServices?[index];
                                          return Container(
                                            margin: EdgeInsets.symmetric(vertical: 5),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: index == 0
                                                          ? Colors.blue
                                                          : index == 1
                                                          ? Colors.greenAccent
                                                          : Colors.purpleAccent,
                                                      shape: BoxShape.circle),
                                                  padding: EdgeInsets.all(2),
                                                  child: Icon(
                                                    Icons.done,
                                                    size: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                      '${service?.service}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 17),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ))
                                              ],
                                            ),
                                          );
                                    }),
                                    Spacer(),
                                    Center(
                                      child: Container(
                                        height: 40,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color: index == 0
                                              ? Colors.blue
                                              : index == 1
                                                  ? Colors.greenAccent
                                                  : Colors.purpleAccent,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            final Uri uri = Uri(
                                                scheme: 'tel', path: '01571767287'
                                              /*path: controller.searchModel.value?.adminPhone
                                    .toString()*/
                                            );

                                            await launchUrl(uri,
                                            mode: LaunchMode.externalApplication);
                                          },
                                          child: Center(
                                            child: Text(
                                              'Call Us 01968732222',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                              // style: h2.copyWith(
                                              //     color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    10.verticalSpace,
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
            )),
      ),
    );
  }
}

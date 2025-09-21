import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/guide%20line/aboutus_controller.dart';
import 'package:jatri_app/src/models/guide_lines_model.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import '../../widgets/text/kText.dart';

class FaqPage extends StatefulWidget {
  @override
  State<FaqPage> createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
  final AboutUsController aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: 'Frequently Asked Questions'),
      body: Obx(() {
        if (aboutUsController.isLoading.value) {
          return Center(child: loader());
        } else {
          return Stack(
            children: [
              Container(
                height: 125.h,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow:[
                      BoxShadow(color:Colors.black.withOpacity(0.4),blurRadius:2,spreadRadius: 1),
                      BoxShadow(color:Colors.white.withOpacity(0.4),blurRadius:2,spreadRadius: 1)
                    ]
                ),
              ),
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child:Image.asset('assets/icons/Gari-Lagbee-icon.png'),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 177.h,
                    ),
                    KText(
                      text: "Frequently Asked Questions",
                      fontWeight: FontWeight.bold,
                      fontSize: 19.h,
                    ),
                    SizedBox(height: 15.h),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: aboutUsController.faq.length,
                        itemBuilder: (BuildContext context, index) {
                          Faq faqData = aboutUsController.faq[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpansionTile(
                              title: Text(
                                faqData.question ?? 'Question',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.grey.shade300,
                              collapsedBackgroundColor: Colors.grey.shade300,
                              children: [
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(18.0.h),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Answer: ${faqData.answer ?? 'No answer available'}"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}


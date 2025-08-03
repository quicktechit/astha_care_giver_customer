import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/appBaseUrls.dart';
import '../../../widgets/ustom_image_view.dart';

class SpacialOffer extends StatefulWidget {
  const SpacialOffer({super.key});

  @override
  State<SpacialOffer> createState() => _SpacialOfferState();
}

class _SpacialOfferState extends State<SpacialOffer> {

  final HomeController homeController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'Special Offer',
          color: white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: homeController.specialOffer.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item=homeController.specialOffer[index];
                return Card(
                  elevation: 2,
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    tileColor: maincolor.withOpacity(0.1),
                    contentPadding: EdgeInsets.all(8),
                    // Adjust the padding of ListTile
                    title: Row(
                      children: [
                        // Image Container
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showImageDialog(context,
                                    Urls.getImageURL(endPoint: item.image.toString()));
                              },
                              child: SizedBox(
                                width: 80, // Set desired width
                                height: 80, // Set desired height
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    Urls.getImageURL(endPoint: item.image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                                width: 100,
                                child: KText(text: '${item.carName}',maxLines: 2, fontSize: 13.5,fontWeight: FontWeight.bold,)),
                            Row(
                              children: [
                                KText(
                                  text: 'Sit: ',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                KText(text: '${item.sit}', fontSize: 13),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width/2.01,
                                child: Row(
                                  children: [
                                    KText(
                                      text: 'From: ',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    KText(text: '${item.fromAddress}', fontSize: 15),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width/2.01,
                                child: Row(
                                  children: [
                                    KText(
                                      text: 'To: ',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    KText(text: '${item.toAddress}', fontSize: 15),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  KText(
                                    text: 'Price: ',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  KText(text: '${item.price}Tk', fontSize: 14),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone: ",
                                    style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    // Prevent overflow by limiting text
                                    overflow: TextOverflow
                                        .ellipsis, // Add ellipsis for overflow
                                  ),
                                  Text(
                                    "${item.phone}",
                                    style: TextStyle(fontSize: 13),
                                    maxLines: 3,
                                    // Prevent overflow by limiting text
                                    overflow: TextOverflow
                                        .ellipsis, // Add ellipsis for overflow
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${item.description}",
                                      style: TextStyle(fontSize: 13),
                                      maxLines: 3,
                                      // Prevent overflow by limiting text
                                      overflow: TextOverflow
                                          .ellipsis, // Add ellipsis for overflow
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Uri uri = Uri(
                                scheme: 'tel',
                                path: '${item.phone}');

                            await launchUrl(uri, mode: LaunchMode.externalApplication);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: maincolor),
                            child: Text(
                              'Call',
                              style: TextStyle(color: white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

}

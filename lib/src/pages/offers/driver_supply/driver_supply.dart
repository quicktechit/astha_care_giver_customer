import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/slider/slider_widget.dart';

class DriverSupply extends StatefulWidget {
  const DriverSupply({super.key});

  @override
  State<DriverSupply> createState() => _DriverSupplyState();
}

class _DriverSupplyState extends State<DriverSupply> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: KText(text: 'Driver Supply',color: white,fontWeight: FontWeight.bold,fontSize: 16,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeH5,
            SliderWidget(),
            sizeH20,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: homeController.driverSupply.length,
              itemBuilder: (context, index) {
                final item = homeController.driverSupply[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    // Leading image
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        Urls.getImageURL(endPoint: item.image.toString()),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Title and description
                    title: Text(
                      "${item.name}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.justify,
                          "Description: ${item.description}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          "Address: ${item.address}",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    // Trailing button
                    trailing: GestureDetector(
                      onTap: () async {
                        if(item.link==null){
                          Get.snackbar('No Address Available', '');
                        }else{
                          await launchUrl(Uri.parse('${item.link}'));
                        }

                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: maincolor,
                        ),
                        child: Text(
                          'Book now',
                          style: TextStyle(fontSize: 11, color: white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

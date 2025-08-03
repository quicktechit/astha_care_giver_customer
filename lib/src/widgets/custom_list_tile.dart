import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/widgets/card/customCardWidget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
class CustomListTile extends StatelessWidget {
  final IconData icons;
  final String title;
  final String content;

  const CustomListTile({super.key, required this.icons, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return  CustomCardWidget(
      width: Get.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 1,
        ),
        child: Card(
          shadowColor: maincolor.withOpacity(0.4),
          elevation: 3,
          child: ListTile(

            tileColor:grey.shade200,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: maincolor,
              child: Icon(
                icons,
                size: 20,
                color: white,
              ),
            ),
            title: KText(
              text: title,
              color: black45,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            subtitle: KText(
              text: content,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

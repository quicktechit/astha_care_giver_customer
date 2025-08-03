import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
class NoteTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const NoteTextFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: Get.width,
      color: white,
      child: Padding(
        padding: paddingH20,
        child: Column(
          children: [
            sizeH20,
            TextFormField(
              controller: controller,
              maxLength: 200,
              maxLines: null,
              minLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                fillColor: grey.shade200,
                filled: true,
                hintText: 'addANote'.tr,
                hintStyle: GoogleFonts.sourceSansPro(
                  fontSize: 12,
                ),
              ),
            ),
            sizeH5,
          ],
        ),
      ),
    );
  }
}

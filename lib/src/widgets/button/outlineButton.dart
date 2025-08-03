import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/appColors.dart';
import '../text/kText.dart';

outlineButton({
  required buttonName,
  required void Function()? onTap,
  double? height,
  double? width,
  double? radius,
  double? fontSize,
  Color? textColor,
  Color? outlineColor,
  Color? backgroundColor,
  FontWeight? fontWeight,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: height == null ? 50 : height,
        width: width == null ? Get.width : width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius == null ? 30 : radius),
          border: Border.all(
            color: outlineColor != null ? outlineColor : grey,
          ),
        ),
        child: Center(
          child: KText(
            text: buttonName,
            color: textColor == null ? primaryColor : textColor,
            fontSize: fontSize == null ? 16 : fontSize,
            fontWeight:fontWeight!=null? fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jatri_app/src/configs/appColors.dart';

import '../text/kText.dart';

Widget primaryButton({
  required buttonName,
  final IconData? icon,
  final color,
  required void Function()? onTap,
}) =>
    ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          color??maincolor,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KText(
              text: buttonName,
              color: white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            if (icon != null)
              SizedBox(
                width: 10.h,
              ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              )
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';


class LoaderUtils {
  Widget showLoading() {
    return SizedBox(
      height: 100.h,
      width: 200.w,
      child:  Center(
        child: SpinKitChasingDots(color: maincolor),
      ),
    );
  }

  showGetLoading() {
    Get.isDialogOpen ?? true
        ? const Offstage()
        : Get.dialog(
        const Center(
          child: SpinKitChasingDots(color: Colors.orange),
        ),
        barrierDismissible: false);
  }

  hideGetLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}

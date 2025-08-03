import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configs/appColors.dart';
import '../../configs/appUtils.dart';
import '../text/kText.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final appbarTitle;
  final bool? isActionEnable;
  final void Function()? onTap;
  final bool showLeadingIcon;

  CustomAppBar({
    Key? key,
    required this.appbarTitle,
    this.isActionEnable,
    this.onTap,
    this.showLeadingIcon = true,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: maincolor,
      title: Text(
        appbarTitle.toString().tr,
        style: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
      automaticallyImplyLeading:showLeadingIcon,
      leading: showLeadingIcon==true
          ? IconButton(
            tooltip: 'Back Button',
            icon: Icon(
              Icons.arrow_back,
              size: 18.h,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          )
          : null,
      actions: [
        isActionEnable == true
            ? GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  size: 25,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
            : Container(),
        sizeW10,
      ],
    );
  }
}

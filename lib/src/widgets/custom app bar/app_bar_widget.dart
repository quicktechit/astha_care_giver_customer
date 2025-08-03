import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/notification%20controller/notification_controller.dart';
import 'package:jatri_app/src/pages/notification%20page/notification_page.dart';
import 'package:jatri_app/src/pages/profile/profile_dashboard.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class CustomCommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  CustomCommonAppBar({
    required this.title,
    this.scaffoldKey,
  });

  @override
  State<CustomCommonAppBar> createState() => _CustomCommonAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomCommonAppBarState extends State<CustomCommonAppBar> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();
  final NotificationController _notificationController =
      Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    _notificationController.getNotification();
    // _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
    //   setState(() {
    //     _currentTime = DateTime.now();
    //   });
    // });
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('dd/MM/yyyy').format(_currentTime);
    // String formattedTime = DateFormat('h:mm a').format(_currentTime);

    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.white,
      // title: GestureDetector(
      //   onTap: (){
      //     Get.to(()=>SearchPage());
      //   },
      //   child: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 5),
      //     height: 35,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(15),
      //         border: Border.all(color: Colors.white, width: 1.5)),
      //     child: Row(mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         KText(text: 'Search Car Location',color: Colors.white,fontWeight: FontWeight.w500,),Spacer(),
      //         Icon(Icons.search_rounded,color: Colors.white,)
      //       ],
      //     ),
      //   ),
      // ),
      title: Image.asset("assets/icons/Gari-Lagbee-12.png",height: 32,),
      leadingWidth: 150,
      actions: [
        GestureDetector(
            onTap: () {
              Get.to(()=>NotificationsPage());
            },
            child: Image.asset(
              "assets/icons/notification-bell.png",
              color: maincolor,
              scale: 17,
            )),
        20.horizontalSpace,
        // GestureDetector(
        //   onTap: (){
        //     Get.to(()=>ProfileDashboard());
        //   },
        //     child: Image.asset(
        //   "assets/icons/setting.png",
        //   color: maincolor,
        //   scale: 17,
        // )),
        10.horizontalSpace,
        // Column(mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Text(
        //       formattedTime,
        //       style: TextStyle(color: Colors.white, fontSize: 14),
        //     ),
        //     Text(
        //       formattedDate,
        //       style: TextStyle(color: Colors.white, fontSize: 14),
        //     ),
        //   ],
        // ),
        // 10.horizontalSpace,
        // // GestureDetector(
        // //   onTap: () => Get.to(NotificationsPage()),
        // //   child: Padding(
        // //     padding: EdgeInsets.symmetric(vertical: 15),
        // //     child: Image.asset(
        // //       "assets/images/notification.png",
        // //       scale: 17,
        // //       color: Colors.white,
        // //     ),
        // //   ),
        // // ),
        // // SizedBox(
        // //   width: 20,
        // // )
      ],
    );
  }
}

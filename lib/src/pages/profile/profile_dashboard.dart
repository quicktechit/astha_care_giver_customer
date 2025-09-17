import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/pages/profile/profilePage.dart';

import '../../configs/appBaseUrls.dart';
import '../../configs/appUtils.dart';
import '../../configs/local_storage.dart';
import '../../controllers/profile controllers/profile_get_controller.dart';
import '../../widgets/lang/langWidget.dart';
import '../../widgets/text/kText.dart';
import '../auth/AuthStartVerifyPage.dart';
import '../notification page/notification_page.dart';

class ProfileDashboard extends StatefulWidget {
  const ProfileDashboard({super.key});

  @override
  State<ProfileDashboard> createState() => _ProfileDashboardState();
}

class _ProfileDashboardState extends State<ProfileDashboard> {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(

          children: [
            10.verticalSpace,
            Container(
              color: maincolor,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: NetworkImage(
                        Urls.getImageURL(
                          endPoint: _profileController.image.toString(),
                        ),
                      ),
                    ),
                  ),
                  15.horizontalSpace,
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KText(
                        text: _profileController.customerName.toString(),
                        color: Colors.white,
                        fontSize: 18.h,
                        fontWeight: FontWeight.bold,
                      ),
                      sizeW5,
                      KText(
                        text: _profileController.phone.toString(),
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ],
                  )
                ],
              ),
            ),
            20.verticalSpace,
            Column(
              children: [
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/pro.png",
                    scale: 19,
                  ),
                  title: Text('profile'.tr),
                  onTap: () {
                    Get.to(() => ProfilePage());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/information.png",
                    scale: 19,
                  ),
                  title: Text('aboutUs'.tr),
                  onTap: () {
                    // Get.to(() => AboutUs());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/world.png",
                    scale: 19,
                  ),
                  title: Text('language'.tr),
                  onTap: () {
                    Get.to(() => LanguagesWidget());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/help-web-button.png",
                    scale: 19,
                  ),
                  title: Text('help'.tr),
                  onTap: () {
                    // Get.to(() => HelpPage());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/notification.png",
                    scale: 19,
                  ),
                  title: Text('notifications'.tr),
                  onTap: () {
                    Get.to(() => NotificationsPage());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                // 10.verticalSpace,
                // ListTile(
                //   dense: true,
                //   leading: Image.asset(
                //     "assets/images/promo.png",
                //     scale: 19,
                //   ),
                //   title: Text('promoCode'.tr),
                //   onTap: () {
                //     Get.to(() => PromoOfferPage());
                //   },
                //   tileColor: Colors.blue.shade50,
                //   // Set the background color for the tile
                //   shape: RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.circular(10), // Set the round border radius
                //   ),
                // ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/animations/terms-conditions_1458279.png",
                    scale: 19,
                  ),
                  title: Text('Terms & Conditions'.tr),
                  onTap: () {
                    // Get.to(() => TermsAndCondition());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/animations/shield_6011441.png",
                    scale: 19,
                  ),
                  title: Text('Privacy Policy'.tr),
                  onTap: () {
                    // Get.to(() => PrivacyPolicy());
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
                10.verticalSpace,
                ListTile(
                  dense: true,
                  leading: Image.asset(
                    "assets/images/logout.png",
                    scale: 19,
                  ),
                  title: Text('logOut'.tr),
                  onTap: () {
                    _showLogoutConfirmationDialog(context);
                  },
                  tileColor: Colors.blue.shade50,
                  // Set the background color for the tile
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Set the round border radius
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'.tr),
          content:
              Text('Are you sure you want to logout from Customer App?'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'no'.tr,
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                _handleLogout();
              },
              child: Text(
                'yes'.tr,
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleLogout() {
    SharedPreferencesManager.getInstance().then((manager) {
      manager.clearAll();
    });
    Get.offAll(() => AuthStartPage());
  }
}

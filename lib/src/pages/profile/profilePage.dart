import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/profile%20controllers/profile_get_controller.dart';
import 'package:jatri_app/src/pages/profile/profileEditPage.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/custom_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showLeadingIcon: true,
        appbarTitle: 'profile',
      ),
      body: Obx(() {
        if (_profileController.isLoading.value) {
          return Center(child: loader());
        } else {
          return Stack(
            children: [
              Container(
                width: Get.width,
                height: Get.height,
                color: Colors.white,
              ),
              Positioned(
                child: Container(
                  width: Get.width,
                  height: 180,
                  color: Colors.black,
                  child: Image.asset(
                    'assets/icons/Monthly-Car-Rental-in-Los-Angeles.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                bottom: 410.h,
                left: 25.w,
                child: Container(
                  width: Get.width / 1.21,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: maincolor.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 0.5,
                            offset: Offset(0.5, 0.5)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(70),
                          bottomLeft: Radius.circular(70))),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: maincolor.withOpacity(0.4), width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 53,
                          backgroundImage: NetworkImage(
                            Urls.getImageURL(
                              endPoint: _profileController.image.toString(),
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              _profileController.customerName.toString(),
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text(
                            "📞: ${_profileController.phone.toString()}",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 415.h,
                left: 98.w,
                child: GestureDetector(
                  onTap: () async {
                    await Get.to(EditProfilePage(
                      firstName: _profileController.customerName.toString(),
                      lastName: '',
                      image: _profileController.image.toString(),
                      address: _profileController.address.toString(),
                      city: _profileController.city.toString(),
                      dob: _profileController.dob.toString(),
                      email: _profileController.email.toString(),
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: maincolor.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 200.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      CustomListTile(
                        icons: Icons.alternate_email,
                        title: 'email',
                        content: _profileController.email.toString(),
                      ),
                      CustomListTile(
                        icons: Icons.transgender,
                        title: 'gender',
                        content: _profileController.gender.toString(),
                      ),
                      CustomListTile(
                        icons: Icons.date_range_outlined,
                        title: 'dateOfBirth',
                        content: _profileController.dob.toString(),
                      ),
                      50.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                final Uri url = Uri.parse(
                                    'https://www.facebook.com/share/1Lg9wSxWcE/');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Image.asset(
                                "assets/animations/facebook (1).png",
                                scale: 15,
                              )),
                          20.horizontalSpace,
                          GestureDetector(
                              onTap: () async {
                                final Uri url = Uri.parse(
                                    'https://youtube.com/shorts/dKk795svetw?si=PJHarCb-ahuxaD_g');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Image.asset(
                                "assets/animations/youtube (1).png",
                                scale: 11,
                              )),
                          20.horizontalSpace,
                          GestureDetector(
                              onTap: () async {
                                final Uri url =
                                    Uri.parse('https://pickupvara.com/');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Image.asset(
                                "assets/animations/internet.png",
                                scale: 14,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

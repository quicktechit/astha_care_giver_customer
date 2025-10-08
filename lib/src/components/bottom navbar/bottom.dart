import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/controllers/home_controller/home_controller.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/pages/home/homePage.dart';
import 'package:jatri_app/src/pages/profile/profile_dashboard.dart';

import '../../controllers/common_controller.dart';
import '../../controllers/profile controllers/profile_get_controller.dart';
import '../../pages/profile/profilePage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final HomeController homeController=Get.put(HomeController());
  final profileController = Get.put(ProfileController());
  final CommonController controller=Get.put(CommonController());
  @override
  void initState() {
    super.initState();
    profileController.getProfileData().then((value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Delay for 10 seconds
        controller.getCustomerStatus('');
        Future.delayed(Duration(seconds: 1), () {
          if (profileController.customerData.value.name == null) {
            homeController.selectedItemPosition.value = 2;
            Get.to(() => ProfilePage());
            Get.snackbar(
              'Warning',
              'Please Update Your Profile to Continue',
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: Duration(seconds: 10),
            );
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: Obx(
            ()=>AnimatedContainer(
            child: _getPage(homeController.selectedItemPosition.value),
            duration: const Duration(seconds: 1),
          ),
        ),
        bottomNavigationBar: Obx(
          ()=> SizedBox(
            height: 90,
            child: SnakeNavigationBar.color(
              behaviour: SnakeBarBehaviour.pinned,
              backgroundColor: Colors.white,
              snakeShape: SnakeShape.rectangle,
              snakeViewColor: Colors.white,

              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.black,

              showUnselectedLabels: true,
              showSelectedLabels: true,

              selectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12,
              ),

              currentIndex: homeController.selectedItemPosition.value,
              onTap: (index) {
                if (profileController.customerData.value.name != null) {
                  setState(() =>
                  homeController.selectedItemPosition.value = index,
                  );
                } else {
                  // Show warning here if needed
                }
              },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'History'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings'.tr,
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if(homeController.selectedItemPosition.value!=0){
      homeController.selectedItemPosition.value=0;
      return false;
    }else{
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit the customer app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        ),
      ).then((value) => value ?? false);
    }


  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return AllTripHistoryPage();
      case 2:
        return ProfileDashboard();
      default:
        return HomePage();
    }
  }
}

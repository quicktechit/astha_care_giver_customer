import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/controllers/rental%20trip%20history%20controller/rental_trip_history_controller.dart';
import 'package:jatri_app/src/controllers/return%20trip%20history%20controller/return_trip_history_controller.dart';
import 'package:jatri_app/src/widgets/trip%20history/cancel_trip_history.dart';
import 'package:jatri_app/src/widgets/trip%20history/confirm_trip_history_widget.dart';
import 'package:jatri_app/src/widgets/trip%20history/conplete_trip_history.dart';
import 'package:jatri_app/src/widgets/trip%20history/ongoing_trip_history.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../widgets/trip history/all_trip_history.dart';

class AllTripHistoryController extends GetxController {
  final SidebarXController sidebarController =
      SidebarXController(selectedIndex: 0, extended: true);

  void refresh() {
    final ReturnHistoryController _returnC = Get.put(ReturnHistoryController());
    _returnC.getReturnHistory();
  }
}

class AllTripHistoryPage extends StatefulWidget {
  @override
  State<AllTripHistoryPage> createState() => _AllTripHistoryPageState();
}

class _AllTripHistoryPageState extends State<AllTripHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AllTripHistoryController controller =
      Get.put(AllTripHistoryController());
  final RentalTripHistoryController rentalTripHistoryController =
      Get.put(RentalTripHistoryController());

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    // rentalTripHistoryController.getReturnTrip();
    // rentalTripHistoryController.getTrip();
    // rentalTripHistoryController.getDivisionTrip();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rentalTripHistoryController.getAllConfirmSortingTrip();
      rentalTripHistoryController.getAllSortingTrip();
      rentalTripHistoryController.getAllCancelSortingTrip();
      rentalTripHistoryController.getAllCompleteSortingTrip();
      rentalTripHistoryController.getAllStartSortingTrip();
    });
    controller.refresh();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 10,
        leading: SizedBox(),
        backgroundColor: maincolor,
        bottom: TabBar(
          controller: tabController,
          isScrollable: true,
            tabAlignment:TabAlignment.start,
          tabs: [
            Tab(text: 'All Service'.tr),
            Tab(text: 'Confirmed Service'.tr),
            Tab(text: 'Ongoing Service'.tr),
            Tab(text: 'Completed Service'.tr),
            Tab(text: 'Cancelled Service'.tr),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AllTripHistory(),
          ConfirmTripHistory(),
          OngoingTripHistory(),
          CompleteTripHistory(),
          CancelTripHistory(),
        ],
      ),
    );
  }
}

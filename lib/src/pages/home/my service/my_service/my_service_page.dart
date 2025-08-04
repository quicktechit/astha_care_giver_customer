import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../configs/appColors.dart';
import '../../../../controllers/rental trip history controller/rental_trip_history_controller.dart';
import '../../../../widgets/trip history/all_trip_history.dart';
import '../../../../widgets/trip history/cancel_trip_history.dart';
import '../../../../widgets/trip history/confirm_trip_history_widget.dart';
import '../../../../widgets/trip history/conplete_trip_history.dart';
import '../../../../widgets/trip history/ongoing_trip_history.dart';
import '../../../Trip History/trip_history_page.dart';

class MyServicePage extends StatefulWidget {
  const MyServicePage({super.key});

  @override
  State<MyServicePage> createState() => _MyServicePageState();
}

class _MyServicePageState extends State<MyServicePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AllTripHistoryController controller =
  Get.put(AllTripHistoryController());
  final RentalTripHistoryController rentalTripHistoryController =
  Get.put(RentalTripHistoryController());

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    // rentalTripHistoryController.getReturnTrip();
    // rentalTripHistoryController.getTrip();
    // rentalTripHistoryController.getDivisionTrip();
    rentalTripHistoryController.getAllConfirmSortingTrip();
    rentalTripHistoryController.getAllSortingTrip();
    rentalTripHistoryController.getAllCancelSortingTrip();
    rentalTripHistoryController.getAllCompleteSortingTrip();
    rentalTripHistoryController.getAllStartSortingTrip();
    controller.refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            // Tab(text: 'Confirmed Service'.tr),
            Tab(text: 'Ongoing Service'.tr),
            Tab(text: 'Completed Service'.tr),
            // Tab(text: 'Cancelled Service'.tr),
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
          // ConfirmTripHistory(),
          OngoingTripHistory(),
          CompleteTripHistory(),
          // CancelTripHistory(),
        ],
      ),
    );
  }
}

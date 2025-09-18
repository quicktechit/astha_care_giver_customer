import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/distance_controller/distance_time_controller.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configs/appBaseUrls.dart';
import '../../configs/empty_box_widget.dart';
import '../../configs/loader.dart';
import '../../controllers/language/langController.dart';
import '../../controllers/rental trip history controller/rental_trip_history_controller.dart';
import '../../models/all_service_model.dart';
import '../../pages/Trip History/map_page_view.dart';
import '../../pages/single history trip details/single_history_trip_details.dart';
import '../custom_service.dart';
import '../history_time_widget.dart';

class AllTripHistory extends StatefulWidget {
  const AllTripHistory({super.key});

  @override
  State<AllTripHistory> createState() => _AllTripHistoryState();
}

class _AllTripHistoryState extends State<AllTripHistory> {
  final LangController langController = Get.find();
  final RentalTripHistoryController _controller =
  Get.put(RentalTripHistoryController());
  int maxWordsToShow = 4;
  final DistanceTimeController distanceTimeController =Get.put(DistanceTimeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => _controller.isLoading.value
            ? Center(
          child: loader(),
        )
            : _controller.allSortingTripHistoryData.value.sortedTrips == null || _controller.allSortingTripHistoryData.value.sortedTrips!.isEmpty
            ? EmptyBoxWidget(title: 'No trip history available yet!')
            : SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _controller.allSortingTripHistoryData
                    .value.sortedTrips?.length ??
                    0,
                itemBuilder: (context, index) {
                  var item = _controller.allSortingTripHistoryData
                      .value.sortedTrips?[index];
                  if (item == null) return SizedBox.shrink();
                  double upLat = 0.0, upLng = 0.0;

                  return customService(
                    context: context,
                    amount: item.amount,
                    trip: item.getTrip,
                  ).onTap(() {
                    Get.to(() => SingleHistoryTripDetailsPage(
                      tripId: "${item.tripId}",
                    ));
                  });
                },
              ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  String truncateTextIfNeeded(String text, int maxWords) {
    if (text == null || text.isEmpty) {
      return "N/A";
    }

    List<String> words = text.split(RegExp(r'\s+'));
    int wordCount = words.length;

    return wordCount > maxWords ? '${words.take(maxWords).join(" ")}...' : text;
  }
}

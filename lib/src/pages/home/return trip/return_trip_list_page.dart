import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/components/drawer/sidebarComponent.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/empty_box_widget.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/return%20trip%20controller/return_filter_controller.dart';
import 'package:jatri_app/src/pages/Trip%20History/trip_history_page.dart';
import 'package:jatri_app/src/pages/home/return%20trip/bid_now_page.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/car_container_widget.dart';
import 'package:jatri_app/src/widgets/custom%20app%20bar/app_bar_widget.dart';
import 'package:jatri_app/src/widgets/history_time_widget.dart';
import 'package:jatri_app/src/widgets/partner_bid_area_details_widget.dart';
import 'package:jatri_app/src/widgets/status_widget.dart';
import 'package:jatri_app/src/models/filter_return_trip_model.dart';

import '../../../configs/appUtils.dart';
import '../../../widgets/return_trip_filter_widget.dart';
import '../../../widgets/text/kText.dart';

class ReturnTripListPage extends StatefulWidget {
  final String pick;
  final String drop;
  final String carId;
  ReturnTripListPage(
      {required this.pick, required this.drop, required this.carId});
  @override
  State<ReturnTripListPage> createState() => _ReturnTripListPageState();
}

class _ReturnTripListPageState extends State<ReturnTripListPage> {
  final ReturnTripFilter returnTripFilter = ReturnTripFilter();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AllTripHistoryController controller =
      Get.put(AllTripHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ExampleSidebarX(
          controller: controller.sidebarController,
        ),
      ),
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: KText(text: 'return',color: white,fontWeight: FontWeight.bold,fontSize: 17,),
        actions: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      child: CustomBottomSheetWidget());
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              child: Row(children: [
                KText(text: 'filter'),
                sizeW5,
                Icon(Icons.sort,color: Colors.black,),

              ],),
            ),
          ),
          sizeW10,
        ],
      ),
      body: FutureBuilder<List<FilterReturnTrip>>(
        future: _fetchReturnTrips(),
        builder: (context, AsyncSnapshot<List<FilterReturnTrip>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            if (snapshot.data?.isEmpty ?? true) {
              return EmptyBoxWidget(
                  title: 'Opps! No Return trip Available now');
            }

            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final FilterReturnTrip trip = snapshot.data![index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          StatusWidget(
                            iconColor: Colors.black,
                            icon: Icons.watch_later_outlined,
                            statusTitle: 'Trip Time',
                            textColor: Colors.black,
                          ),
                          Spacer(),
                          HistoryTimeWidget(
                            date: trip.timedate.toString(),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: CustomPaint(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                        ),
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PartnerBidAreaDetails(
                                areaOne: trip.location ?? '',
                                areaTwo: trip.destination ?? '',
                                feeOfPartner: trip.amount ?? '',
                              ),
                            ],
                          ),
                        ),
                      ),
                      CarContainerWidget(
                        img: Urls.getImageURL(
                            endPoint: trip.getvehicle!.image.toString()),
                        carName: trip.getvehicle!.name.toString(),
                        capacity:
                            '${trip.getvehicle!.capacity.toString()} Seats Capacity',
                      ),
                      SizedBox(height: 20),
                      Container(
                        color: Colors.white,
                        child: primaryButton(
                          icon: Icons.arrow_circle_right_outlined,
                          buttonName: 'Bid Your Fare',
                          onTap: () {
                            Get.to(() => ReturnTripBidNowPage(
                                  partnerId: trip.partnerId.toString(),
                                  pickDivision: trip.location.toString(),
                                  dropDivision: trip.destination.toString(),
                                  partnerBidId: trip.id.toString(),
                                  partnerFare: trip.amount.toString(),
                                  carName: trip.getvehicle!.name.toString(),
                                  carImg: trip.getvehicle!.image.toString(),
                                  capacity:
                                      trip.getvehicle!.capacity.toString(),
                                  tripTime: trip.timedate.toString(),
                                ));
                            print(
                                "Trip Id=============${trip.id.toString()}");

                            print(
                                "Partner  Id===========${trip.partnerId.toString()}");
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<FilterReturnTrip>> _fetchReturnTrips() async {
    try {
      await returnTripFilter.returnTripFilter(
        pickUpLocation: widget.pick,
        carId: widget.carId,
        dropLocation: widget.drop,
      );

      return returnTripFilter.filterReturnTripModel.value.data ?? [];
    } catch (e) {
      print('Error fetching return trips: $e');
      return [];
    }
  }
}

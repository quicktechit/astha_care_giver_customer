import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import '../controllers/fixed_trip/fix_trip_controller.dart';

class DriverInfoWidget extends StatefulWidget {
  final String id;

  const DriverInfoWidget({super.key, required this.id});

  @override
  State<DriverInfoWidget> createState() => _DriverInfoWidgetState();
}

class _DriverInfoWidgetState extends State<DriverInfoWidget> {
  final QuickTechFixedTripController fixedTripController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.person),
            sizeW20,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Driver Info',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                KText(
                  text: 'A Driver will be assigned very soon',
                  fontSize: 15.h,
                  fontWeight: FontWeight.w400,
                ),
                sizeW20,
                GestureDetector(
                  onTap: () {
                    cancelTripRequestReason(context, widget.id, 'confirm');
                    // showModalBottomSheet(
                    //   isScrollControlled: true,
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Container(child: CustomBottomSheetCallCenterWidget());
                    //   },
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.redAccent)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: KText(
                        text: 'Cancel Trip',
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void cancelTripRequestReason(
    BuildContext context,
    String tripId,
    String type,
  ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Cancel trip?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Why do you want to cancel?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 160.h,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: fixedTripController.customerAfterData.length,
                      itemBuilder: (context, index) {
                        var data =
                            fixedTripController.customerAfterData[index];
                        return ListTile(
                          leading: Icon(Icons.no_crash),
                          title: Text(data.title.toString()),
                          onTap: () {
                            fixedTripController.cancelConfirmTrip(
                                tripId: tripId, reasonId: data.id.toString());
                          },
                        );
                      }),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Keep my trip"),
                ),
              ],
            ),
          );
        });
  }
}

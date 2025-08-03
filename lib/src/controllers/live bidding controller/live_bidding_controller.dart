import 'dart:developer';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/base_client.dart';
import 'package:jatri_app/src/models/live_bidding_model.dart';

class LiveBiddingController extends GetxController {
  var isLoading = false.obs;
  var liveBidData = <LiveBidData>[].obs;

  @override
  void onInit() async {

    super.onInit();
  }

  void getLiveBid() async {
    try {
      isLoading(true);

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: Urls.liveBid),
      );

      if (responseBody != null) {
        final LiveBiddingModel rentalTrip =
            LiveBiddingModel.fromJson(responseBody);
        print('live bidding is running');
        if (rentalTrip.data != null && rentalTrip.data!.isNotEmpty) {
          liveBidData.clear();
          liveBidData.assignAll(rentalTrip.data!);
        } else {
          liveBidData.clear();
          throw 'Live Bid History data is empty!';
        }
      } else {
        throw 'Unable to load slider data!';
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../configs/app_texts.dart';

class DistanceTimeController extends GetxController {
  var totalDistance = 0.0.obs;
  var totalDuration = ''.obs;

  Future<void> calculateDistanceAndDuration(double startLat, double startLng, double endLat, double endLng) async {
    final apiKey = AppTexts.googleMapKey;
    final url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
        'origins=$startLat,$startLng&destinations=$endLat,$endLng&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final distanceText = data['rows'][0]['elements'][0]['distance']['text'];
      final durationText = data['rows'][0]['elements'][0]['duration']['text'];
      print(distanceText);
      print(durationText);

      totalDistance.value = double.parse(distanceText.split(' ')[0]);
      totalDuration.value =  durationText ;

  }}
}

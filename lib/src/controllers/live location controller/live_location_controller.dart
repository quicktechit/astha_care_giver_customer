import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/app_texts.dart';
import 'dart:convert';

import 'package:jatri_app/src/models/suggestion_model.dart';

class LocationController extends GetxController {
  final TextEditingController pickUpC = TextEditingController();
  final TextEditingController dropC = TextEditingController();
  var isLoading = false.obs;
  var isLoadingDrop = false.obs;

  var pickUpLocation = ''.obs;
  var dropLocation = ''.obs;
  var viaLocation = ''.obs;
  var selectedPickUpLat = ''.obs;
  var selectedPickUpLng = ''.obs;
  var selectedDropUpLat = ''.obs;
  var selectedDropUpLng = ''.obs;
  var selectedPickUpDistrict  = ''.obs;
  var selectedDropOffDistrict  = ''.obs;
  RxList suggestionsPickUp = <Suggestion>[].obs;
  RxList suggestionsDrop = <Suggestion>[].obs;
  RxList suggestionsVia = <Suggestion>[].obs;

  Future<void> fetchPickSuggestions(String input) async {
    isLoading(true);
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:BD&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        suggestionsPickUp.clear();
        suggestionsPickUp.addAll(predictions
            .map<Suggestion>((e) => Suggestion.fromJson(e))
            .toList());
        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      isLoading(false);
      throw Exception('Failed to load suggestions');
    }
  }

  Future<void> fetchDropSuggestions(String input) async {
    isLoadingDrop(true);
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:BD&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        suggestionsDrop.clear();
        suggestionsDrop.addAll(predictions
            .map<Suggestion>((e) => Suggestion.fromJson(e))
            .toList());
        isLoadingDrop(false);
      } else {
        isLoadingDrop(false);
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      isLoadingDrop(false);
      throw Exception('Failed to load suggestions');
    }
  }

  Future<void> fetchViaSuggestions(String input) async {
    isLoading(true);
    final String baseUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&components=country:BD&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['status'] == 'OK') {
        final predictions = jsonData['predictions'];
        suggestionsVia.clear();
        suggestionsVia.addAll(predictions
            .map<Suggestion>((e) => Suggestion.fromJson(e))
            .toList());
        isLoading(false);
      } else {
        isLoading(false);
        throw Exception('Failed to load suggestions: ${jsonData['status']}');
      }
    } else {
      isLoading(false);
      throw Exception('Failed to load suggestions');
    }
  }

  void selectViaAddress(Suggestion suggestion) async {
    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(detailsUrl));
    isLoading(true);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';
      isLoading(false);
      // Find the administrative_area_level_1 component
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected Drop Address: ${suggestion.description}');
      viaLocation.value = suggestion.description;
      print('Division Drop Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }

  void selectPikUpAddress(Suggestion suggestion) async {
    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(detailsUrl));
    isLoading(true);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';
      isLoading(false);
      // Find the administrative_area_level_1 component
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected PickUp Address: ${suggestion.description}');
      pickUpLocation.value = suggestion.description;
      selectedPickUpLat.value = lat.toString();
      selectedPickUpLng.value = lng.toString();

      print('Division PickUp Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }

  void selectDropAddress(Suggestion suggestion) async {
    final String placeId = suggestion.placeId;
    final String detailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=geometry,address_components&key=${AppTexts.googleMapKey}";

    final response = await http.get(Uri.parse(detailsUrl));
    isLoading(true);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> result = jsonData['result'];
      final Map<String, dynamic> geometry = result['geometry'];
      final Map<String, dynamic> location = geometry['location'];
      final double lat = location['lat'];
      final double lng = location['lng'];

      final List<dynamic> addressComponents = result['address_components'];
      String divisionName = '';
      isLoading(false);
      for (final component in addressComponents) {
        final List<dynamic> types = component['types'];
        if (types.contains('administrative_area_level_1')) {
          divisionName = component['long_name'];
          break;
        }
      }

      print('Selected Drop Address: ${suggestion.description}');
      dropLocation.value = suggestion.description;

      selectedDropUpLat.value = lat.toString();
      selectedDropUpLng.value = lng.toString();

      print('Division Drop Name: $divisionName');
      print('Latitude: $lat, Longitude: $lng');

      // You can do other operations with the address, division name, lat, and lng here
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
}

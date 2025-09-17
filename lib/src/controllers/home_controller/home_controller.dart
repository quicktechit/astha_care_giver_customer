import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/models/package_model.dart';
import 'package:jatri_app/src/widgets/quick_tech_loader_util.dart';
import '../../configs/local_storage.dart';
import '../../models/driver_model.dart';
import '../../models/driving_treining_model.dart';
import '../../models/offer_model.dart';
import '../../models/partnarship_model.dart';
import '../../models/travel_model.dart';

class HomeController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var trainingList = <DataT>[].obs;
  var selectedItemPosition = 0.obs;
  var bus = TouristBus().obs;
  var suv = LuxurySuvCar().obs;
  var todayOffer = <ToDays>[].obs;
  var specialOffer = <Special>[].obs;
  var driverTraining = <Training>[].obs;
  var driverSupply = <Supply>[].obs;
  var weddingProgram = <CustomPackage>[].obs;
  var ambulance = <CustomPackage>[].obs;
  var officePick = <CustomPackage>[].obs;
  var carMonthlyRant = <CustomPackage>[].obs;
var partnership=PartnerShipModel().obs;


  Future<void> submitDriverTraining() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String address = addressController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty) {
      print('Please fill in all fields.');
      return;
    }

    bool isEmailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
    if (!isEmailValid) {
      print('Invalid email address.');
      return;
    }

    bool isPhoneValid = RegExp(r'^01[3-9]\d{8}$').hasMatch(phone);
    if (!isPhoneValid) {
      print('Invalid phone number.');
      return;
    }

    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();
    var url = Uri.parse(Urls.drivingTrainingSubmit);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    });

    try {
      LoaderUtils().showLoading();
      var response = await http.post(url, headers: headers, body: body);
      LoaderUtils().hideGetLoading();
      if (response.statusCode == 200) {

        Get.snackbar(
          "Success",""
        );
        print('Response: ${response.body}');
      } else {
        Get.snackbar(
            "Failed",""
        );
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
          "Failed",""
      );
      print('Error: $e');
    }
  }

  void fetchDrivingTrainingList() async {
    SharedPreferencesManager _prefsManager = await SharedPreferencesManager.getInstance();
    String? token = _prefsManager.getToken();

    try {
      isLoading.value = true;
      errorMessage.value = '';

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final response = await http.get(
        Uri.parse(Urls.drivingTrainingList),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData); // Optional debug output

        final model = DrivingTrainingListModel.fromJson(jsonData);
        if (model.success == true && model.data != null) {
          trainingList.assignAll(model.data!);
        } else {
          errorMessage.value = 'No training data found.';
        }
      } else {
        errorMessage.value = 'Failed to load: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchTravelData() async {
    final Uri url = Uri.parse(Urls.travel);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var travel = TravelModel.fromJson(data);
        bus.value = travel.touristBus!;
        suv.value = travel.luxurySuvCar!;
        print('Data: $data');
      } else {
        // If the server returns an error, throw an exception.
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  Future<void> fetchOfferData() async {
    final Uri url = Uri.parse(Urls.offer);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        todayOffer.clear();
        specialOffer.clear();
        var data = json.decode(response.body);
        var offer = OfferModel.fromJson(data);
        todayOffer.value = offer.toDays!;
        specialOffer.value = offer.special!;
        print('Data: $data');
      } else {
        // If the server returns an error, throw an exception.
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDriverData() async {
    final Uri url = Uri.parse(Urls.driver);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        driverSupply.clear();
        driverTraining.clear();
        var data = json.decode(response.body);
        var driver = DriverModel.fromJson(data);
        driverSupply.value = driver.supply!;
        driverTraining.value = driver.training!;
        print('Data: $data');
      } else {
        // If the server returns an error, throw an exception.
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPackageData() async {
    final Uri url = Uri.parse(Urls.package);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        weddingProgram.clear();
        ambulance.clear();
        officePick.clear();
        carMonthlyRant.clear();
        var data = json.decode(response.body);
        var package = PackageModel.fromJson(data);
        weddingProgram.value = package.weddingProgram!;
        ambulance.value = package.ambulanceFreezingcar!;
        officePick.value = package.officepickDropservice!;
        carMonthlyRant.value = package.carMonthlyRent!;
        print('Data: $data');
      } else {
        // If the server returns an error, throw an exception.
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchPartnerships() async {
    // Create the GET request
    var request = http.Request('GET', Uri.parse('${Urls.baseUrl}/customer/partnerships'));

    try {
      // Send the request
      http.StreamedResponse response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        // Convert the response stream to a string
        String responseBody = await response.stream.bytesToString();

        // Decode the JSON response into a Map
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        // Create an instance of PartnerShipModel from JSON data
         partnership.value = PartnerShipModel.fromJson(jsonResponse);

        // Now you have the data in the model, you can access it
        print('Status: ${partnership.value.status}');
        print('Count: ${partnership.value.count}');

        // If you want to print all data items
        partnership.value.data?.forEach((dataItem) {
          print('Data ID: ${dataItem.id}, Image: ${dataItem.image}');
        });

      } else {
        // If the request fails, print the reason phrase
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Request failed: $e');
    }
  }
}
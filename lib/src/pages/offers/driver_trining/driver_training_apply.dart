import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller/home_controller.dart';

class DriverTrainingApplyList extends StatefulWidget {
  const DriverTrainingApplyList({super.key});

  @override
  State<DriverTrainingApplyList> createState() => _DriverTrainingApplyListState();
}

class _DriverTrainingApplyListState extends State<DriverTrainingApplyList> {
  final HomeController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("message init");
    controller.fetchDrivingTrainingList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          } else if (controller.trainingList.isEmpty) {
            return Center(child: Text('No training data found.'));
          }
        
          return ListView.builder(
            itemCount: controller.trainingList.length,
            itemBuilder: (context, index) {
              final data = controller.trainingList[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                elevation: 3,
                child: ListTile(
                  title: Text(data.name ?? "No Name"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${data.email ?? "-"}'),
                      Text('Phone: ${data.phone ?? "-"}'),
                      Text('Address: ${data.address ?? "-"}'),
                      Text('Created: ${data.createdAt ?? "-"}'),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),

    );
  }
}

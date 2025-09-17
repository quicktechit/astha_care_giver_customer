
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/custom_button_widget.dart';
import 'package:jatri_app/src/widgets/text/custom_text_filed_widget.dart';

import '../../../configs/appBaseUrls.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../../widgets/slider/slider_widget.dart';
import '../../../widgets/text/kText.dart';
import 'driver_training_apply.dart';

class DriverTraining extends StatefulWidget {
  const DriverTraining({super.key});

  @override
  State<DriverTraining> createState() => _DriverTrainingState();
}

class _DriverTrainingState extends State<DriverTraining> {
  final HomeController homeController = Get.find();
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: KText(text: 'Driver Training',color: white,fontWeight: FontWeight.bold,fontSize: 16,),
        actions: [
          GestureDetector(
              onTap: (){
                Get.to(()=>DriverTrainingApplyList());
              },
              child: KText(text: "Apply List",color: Colors.white,fontSize: 15,fontWeight:FontWeight.w500,)),
          sizeW10
        ],
      ),
      body: Column(
        children: [
          sizeH5,
          SliderWidget(),
          sizeH20,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: homeController.driverTraining.length,
            itemBuilder: (context, index) {
              final item = homeController.driverTraining[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  // Leading image
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      Urls.getImageURL(endPoint: item.image.toString()),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Title and description
                  title: Text(
                    "${item.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.justify,
                        "Description: ${item.description}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        "Address: ${item.address}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  // Trailing button
                  trailing: GestureDetector(
                    onTap: () async {

                        applyFrom();

                    },
                    child: Container(
                      height: 40,
                      width: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: maincolor,
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(fontSize: 11, color: white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


Future applyFrom() {
  final HomeController homeController = Get.find();

  return Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10), // Remove default padding around dialog
      child: Container(
        width: Get.width, // Full screen width
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: homeController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Driver training Form'.tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                CustomTextFieldWithIcon(
                  controller: homeController.nameController,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter name'.tr : null,
                  label: 'Name'.tr,
                  icon: Icons.person_outline,
                  hinttext: '',
                ),
                SizedBox(height: 10),
                CustomTextFieldWithIcon(
                  controller: homeController.emailController,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter email'.tr : null,
                  label: 'email'.tr,
                  icon: Icons.email_outlined,
                  hinttext: '',
                ),
                SizedBox(height: 10),
                CustomTextFieldWithIcon(
                  controller: homeController.phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter phone'.tr : null,
                  label: 'phone'.tr,
                  icon: Icons.phone_outlined,
                  hinttext: '',
                ),
                SizedBox(height: 10),
                CustomTextFieldWithIcon(
                  controller: homeController.addressController,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter address'.tr : null,
                  label: 'address'.tr,
                  icon: Icons.home_outlined,
                  hinttext: '',
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (homeController.formKey.currentState!.validate()) {
                      Get.back(); // Close dialog
                      homeController.submitDriverTraining();

                      // Optionally clear controllers here
                    }
                  },
                  child: CustomCommonButton2(

                    title: 'Send'.tr,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    barrierDismissible: true,
  );
}

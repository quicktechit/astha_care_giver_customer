import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jatri_app/src/components/bottom%20navbar/bottom.dart';
import 'package:jatri_app/src/configs/appBaseUrls.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/profile%20controllers/edit_profile_controllers.dart';
import 'package:jatri_app/src/controllers/profile%20controllers/profile_get_controller.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/button/primaryButton.dart';
import 'package:jatri_app/src/widgets/custom_form_widget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class EditProfilePage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String address;
  final String city;
  final String dob;
  final String email;
  final String? image;

  EditProfilePage(
      {required this.firstName,
      required this.lastName,
      required this.address,
      required this.city,
      required this.dob,
      required this.email,
      this.image});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController? firstNameTextC;
  TextEditingController? lastNameTextC;
  TextEditingController? addressTextC;
  TextEditingController? emailTextC;
  TextEditingController? cityTextC;
  TextEditingController? dateOfBirthTextC;

  String? selectedItem = 'male';
  XFile? profileImage;

  @override
  void initState() {
    super.initState();

    firstNameTextC = TextEditingController(text: widget.firstName);
    lastNameTextC = TextEditingController(text: widget.lastName);
    addressTextC = TextEditingController(text: widget.address);
    emailTextC = TextEditingController(text: widget.email);
    cityTextC = TextEditingController(text: widget.city);
    dateOfBirthTextC = TextEditingController(text: widget.dob);
  }
  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    final imageTemp = XFile(pickedImage.path);

    setState(() {
      profileImage = imageTemp; // Store the selected image
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarTitle: 'updateProfile',
      ),
      body: Padding(
        padding: paddingH20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      _pickImage();
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (widget.image == null&&profileImage==null)

                         CircleAvatar(
                           radius: 60,
                           child: Icon(Icons.person_outline),
                         ),
                        if (widget.image != null)
                          profileImage!=null?
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(File(profileImage!.path)),
                          ):
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                Urls.getImageURL(endPoint: widget.image!)),
                          ),
                        Positioned(
                          bottom: 0,right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: maincolor.withOpacity(0.7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),)
                      ],
                    ),
                  ),
                ],
              ),
              sizeH30,
              Row(
                children: [
                  Expanded(
                    child: CustomForm(
                      title: 'fullName',
                      requiredStar: '*',
                      controller: firstNameTextC!,
                    ),
                  ),
                  sizeW30,
                ],
              ),
              sizeH30,
              CustomForm(
                title: 'address',
                requiredStar: '',
                controller: addressTextC!,
              ),
              sizeH30,
              CustomForm(
                title: 'city',
                requiredStar: '',
                controller: cityTextC!,
              ),
              sizeH30,
              CustomForm(
                title: 'Email',
                requiredStar: '',
                controller: emailTextC!,
              ),
              sizeH30,
              CustomForm(
                title: 'dateOfBirth',
                requiredStar: '',
                controller: dateOfBirthTextC!,
              ),
              sizeH30,
              Row(
                children: [
                  KText(
                    text: 'gender',
                    color: black54,
                  ),
                  KText(
                    text: '*',
                    color: primaryColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        focusColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        value: 'male',
                        groupValue: selectedItem,
                        onChanged: (String? value) {
                          setState(() {
                            selectedItem = value;
                            print(selectedItem);
                          });
                        },
                      ),
                      KText(text: 'male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        focusColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor),
                        value: 'female',
                        groupValue: selectedItem,
                        onChanged: (String? value) {
                          setState(() {
                            selectedItem = value;
                            print(selectedItem);
                          });
                        },
                      ),
                      KText(text: 'female'),
                    ],
                  ),
                ],
              ),
              sizeH20,
              primaryButton(
                buttonName: 'update',
                onTap: () {
                  if (profileImage == null) {
                    EditProfileController().editProfileMethodWithOutImage(
                      name: firstNameTextC!.text,
                      email: emailTextC!.text,
                      address: addressTextC!.text,
                      city: cityTextC!.text,
                      gender: selectedItem!,
                      dob: dateOfBirthTextC!.text,
                    ).then((value) {
                      ProfileController().getProfileData(
                          token:
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NhcmJvb2suY3V0aWFpZGNvcnBvcmF0aW9uLmNvbS9hcGkvdjEvY3VzdG9tZXIvbG9naW4iLCJpYXQiOjE3MDk0NjEwNzcsImV4cCI6MTcwOTQ2NDY3NywibmJmIjoxNzA5NDYxMDc3LCJqdGkiOiIzYXFIbUFBc1BCZDZtanBHIiwic3ViIjoiMzUiLCJwcnYiOiIxZDBhMDIwYWNmNWM0YjZjNDk3OTg5ZGYxYWJmMGZiZDRlOGM4ZDYzIn0.jjLvB_KCooG_e3jUYWX66AkFQ_jwyRZYMXQk3lbFr7I");
                      Get.offAll(() => DashboardView());
                    });

                  } else {
                    EditProfileController().editProfileMethod(
                      name: firstNameTextC!.text,
                      email: emailTextC!.text,
                      address: addressTextC!.text,
                      city: cityTextC!.text,
                      gender: selectedItem!,
                      dob: dateOfBirthTextC!.text,
                      image: profileImage!,
                    ).then((value) {
                      ProfileController().getProfileData(
                          token:
                          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2NhcmJvb2suY3V0aWFpZGNvcnBvcmF0aW9uLmNvbS9hcGkvdjEvY3VzdG9tZXIvbG9naW4iLCJpYXQiOjE3MDk0NjEwNzcsImV4cCI6MTcwOTQ2NDY3NywibmJmIjoxNzA5NDYxMDc3LCJqdGkiOiIzYXFIbUFBc1BCZDZtanBHIiwic3ViIjoiMzUiLCJwcnYiOiIxZDBhMDIwYWNmNWM0YjZjNDk3OTg5ZGYxYWJmMGZiZDRlOGM4ZDYzIn0.jjLvB_KCooG_e3jUYWX66AkFQ_jwyRZYMXQk3lbFr7I");
                      Get.offAll(() => DashboardView());
                    });

                  }
                },
              ),
              sizeH20,
            ],
          ),
        ),
      ),
    );
  }
}

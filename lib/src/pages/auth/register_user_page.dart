import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import '../../configs/loader.dart';
import '../../controllers/auth controllers/registration_controller.dart';
import '../../widgets/button/primaryButton.dart';
import '../../widgets/text/custom_text_filed_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RegistrationController _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              Image.asset(
                'assets/animations/Banner.png',
                width: 500,
              ),
              KText(
                text: "Welcome to Garilagbee Customer",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              sizeH20,
              CustomTextFieldWithIcon(
                label: 'Name',
                icon: Icons.person_outline,
                keyboardType: TextInputType.text,
                controller: nameController,
                hinttext: 'Enter Name',
              ),
              sizeH20,
              CustomTextFieldWithIcon(
                label: 'Phone',
                icon: Icons.phone,
                keyboardType: TextInputType.number,
                controller: mobileController,
                hinttext: 'Enter Phone',
              ),
              sizeH20,
              CustomTextFieldWithIcon(
                label: 'Enter Password',
                icon: Icons.key,
                keyboardType: TextInputType.text,
                controller: passwordController,
                hinttext: 'Enter Password',
              ),
              sizeH20,
              CustomTextFieldWithIcon(
                label: 'Enter Confirm Password',
                icon: Icons.key,
                keyboardType: TextInputType.text,
                controller: confirmPasswordController,
                hinttext: 'Enter Confirm Password',
              ),
              sizeH20,
              _controller.isLoading.value
                  ? loader()
                  : primaryButton(
                      icon: null,
                      buttonName: 'Register',
                      onTap: () {
                        _controller.registerUser(
                            nameController.text,
                            mobileController.text,
                            passwordController.text,
                            confirmPasswordController.text);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../controllers/auth controllers/intro_controller.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  // Safely build full-screen image using LayoutBuilder
  Widget _buildImage(String url) {
    return Image.asset(
      url,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntroController());

    const pageDecoration = PageDecoration(
      titlePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.zero,
      bodyPadding: EdgeInsets.only(top: 55),
      bodyFlex: 1,

    );

    return IntroductionScreen(
      key: controller.introKey,
      globalBackgroundColor: Colors.white,
      // controlsPadding: EdgeInsets.all(5),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: controller.onIntroEnd,
      onSkip: controller.onIntroEnd,

      pages: [
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildImage("assets/icons/tamplate design.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildImage("assets/icons/tamplate design-2.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildImage("assets/icons/tamplate design-3.jpg"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildImage("assets/icons/tamplate design-4.jpg"),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   titleWidget: const SizedBox.shrink(),
        //   bodyWidget: _buildImage("assets/icons/tamplate design-5.jpg"),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          titleWidget: const SizedBox.shrink(),
          bodyWidget: _buildImage("assets/icons/tamplate design-6.jpg"),
          decoration: pageDecoration,
        ),
      ],

      dotsDecorator: const DotsDecorator(
        activeColor: Colors.blue,
        color: Colors.black26,
        size: Size(5.0, 5.0),
        activeSize: Size(18.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}


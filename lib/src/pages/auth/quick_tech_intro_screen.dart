import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../controllers/auth controllers/intro_controller.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  Widget _buildImage(String url, [double width = 260]) {
    return Image.network(url, width: width);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntroController());

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 16.0),
      imagePadding: EdgeInsets.only(top: 24),
    );

    return IntroductionScreen(
      key: controller.introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "This intro is fully handled with GetX.",
          image: _buildImage("https://picsum.photos/seed/intro1/600/400"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Simple & Fast",
          body: "You don’t need setState or Navigator, only GetX.",
          image: _buildImage("https://picsum.photos/seed/intro2/600/400"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get Started",
          body: "Press Done or Skip to go to the home screen.",
          image: _buildImage("https://picsum.photos/seed/intro3/600/400"),
          footer: ElevatedButton(
            onPressed: controller.onIntroEnd,
            child: const Text("Let's go!"),
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: controller.onIntroEnd,
      onSkip: controller.onIntroEnd,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
        activeColor: Colors.blue,
        size: const Size(10.0, 10.0),
        color: Colors.black26,
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
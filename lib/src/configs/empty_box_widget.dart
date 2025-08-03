import 'package:flutter/material.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
class EmptyBoxWidget extends StatelessWidget {
  final String title;
  const EmptyBoxWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty.png",
            width: 220,
          ),
          KText(
            text: "No Service Found",textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

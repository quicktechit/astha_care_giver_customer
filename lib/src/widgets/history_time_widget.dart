import 'package:flutter/material.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class HistoryTimeWidget extends StatelessWidget {
  final String date;
  const HistoryTimeWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KText(
          text: date,
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}

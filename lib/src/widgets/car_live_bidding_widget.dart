import 'package:flutter/material.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import '../configs/appColors.dart';

class CarLiveBiddingContainerWidget extends StatelessWidget {
  final String img;
  final String rating;
  final String carName;
  final String capacity;
  final String fare;
  final VoidCallback onTap;
  final String carNumber;
  const CarLiveBiddingContainerWidget(
      {super.key,
      required this.img,
      required this.carName,
      required this.capacity,
      required this.rating,
      required this.fare,
      required this.carNumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 90,height: 90,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),border: Border.all(color: maincolor,width: 2)),
              child: ClipOval(
                child: InkWell(
                  onTap: onTap,
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            sizeW20,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: carName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 3),
                KText(
                  text: capacity,
                  fontSize: 15,fontWeight: FontWeight.bold,
                  color: black45,
                ),
                KText(
                  fontWeight: FontWeight.bold,
                  text: fare,
                  fontSize: 15,
                  color: black45,
                ),
              ],
            ),
           Spacer(),
            Column(
              children: [
                KText(
                  text: carNumber,
                  fontSize: 14,
                  color: black45,
                ),
                KText(
                  text: rating,
                  fontSize: 14,
                  color: black45,
                ),
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}

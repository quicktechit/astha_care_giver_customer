import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

import 'partner_fee_widget.dart';

class PartnerBidAreaDetails extends StatelessWidget {
  final String areaOne;
  final String areaTwo;
  final String feeOfPartner;
  const PartnerBidAreaDetails(
      {super.key, required this.areaOne, required this.areaTwo, required this.feeOfPartner});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.location_solid,size: 15,),
            KText(
              text: "Location",
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        KText(
          text: "  $areaOne",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          maxLines: 5,textAlign: TextAlign.start,
        ),
        // sizeH5,
        // Container(
        //   height: .5,
        //   width: Get.width,
        //   color: grey.shade300,
        // ),
        // sizeH5,
        // Row(
        //   children: [
        //     Icon(CupertinoIcons.location_solid,size: 15,),
        //     KText(
        //       text: "Drop Of Location",
        //       fontSize: 11,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ],
        // ),
        // KText(
        //   text: "  $areaTwo",
        //   fontSize: 16,
        //   fontWeight: FontWeight.w600,
        // ),
        // sizeH5,
        // Divider(),
        // PartnerFeeWidget(
        //   partnerFee: feeOfPartner,
        // ),
      ],
    );
  }
}

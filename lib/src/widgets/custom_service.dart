import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../configs/appBaseUrls.dart';
import '../configs/appColors.dart';
import '../models/all_service_model.dart';
import '../pages/home/return trip/return_list_page.dart';

Widget customService({
  required BuildContext context, mapTap,amount,GetTrip? trip}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      5.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Service Time: ${trip?.datetime}".text.semiBold.sm.make(),
          "${trip?.isHourly!=null?"Hourly":trip?.isDaily!=null?"Daily":trip?.weeks!=null?"Weekly":trip?.isMonthly!=null?"Monthly":'One Time'}"
              .text
              .semiBold
              .white
              .makeCentered()
              .box
              .roundedSM
              .size(60, 25)
              .color(primaryColor)
              .make(),
          Image.asset("assets/images/pick.png")
              .box
              .size(30, 25)
              .makeCentered()
              .onTap(mapTap)
        ],
      ),
      7.heightBox,
      Row(
        children: [
          Image.network("${Urls.getImageURL(endPoint: "${trip?.agencyService?.image}")}",
            fit: BoxFit.fill,
          )
              .box
              .roundedSM
              .clip(Clip.antiAlias)
              .size(65, 70)
              .border(color: Colors.black)
              .p1
              .make(),
          5.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              "${trip?.agencyService?.agencyType}".text.semiBold.sm.make(),

              "${trip?.name}".text.semiBold.sm.make(),

              "Age ${trip?.age} Years".text.semiBold.sm.make(),

              "Amount ${amount}Tk".text.semiBold.sm.make()
            ],
          )
        ],
      ),
      7.heightBox,
      DotDividerWidget(),
      7.heightBox,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.location_on_outlined),
          3.widthBox,
          "${trip?.pickupLocation}"
              .text
              .semiBold
              .justify
              .make()
              .w(context.screenWidth / 1.2)
        ],
      ),
      5.heightBox,

    ],
  ).box.padding(EdgeInsets.symmetric(horizontal: 8)).shadowSm.roundedSM.white.margin(EdgeInsets.all(7)).make();
}

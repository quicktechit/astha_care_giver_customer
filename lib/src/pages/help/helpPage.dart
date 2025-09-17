import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/controllers/guide%20line/aboutus_controller.dart';
import 'package:jatri_app/src/pages/guide%20line/faq_page.dart';
import 'package:jatri_app/src/pages/guide%20line/how_use_app_page.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/card/customCardWidget.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  final AboutUsController aboutUsController = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: 'help'),
      backgroundColor: greyBackgroundColor,
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            customListtile(
              title: 'Call Center (7am  - 11:59pm)',
              onTap: () async {
                final Uri url =
                    Uri(scheme: 'tel', path: aboutUsController.call.toString());

                if (await launchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            sizeH5,
            customListtile(
              title: 'Call 999',
              onTap: () async {
                final Uri url = Uri(scheme: 'tel', path: '999');

                if (await launchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            sizeH5,
            customListtile(
              title: 'Email Us',
              onTap: () async {
                final Uri url = Uri(
                    scheme: 'mailto', path: aboutUsController.mail.toString());

                if (await launchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            // sizeH5,
            // customListtile(
            //   title: 'Visit Us',
            //   onTap: () async {
            //     final Uri url = Uri(
            //         scheme: 'https',
            //         path: aboutUsController.website.toString());
            //
            //     if (await launchUrl(url)) {
            //       await launchUrl(url);
            //     } else {
            //       throw 'Could not launch $url';
            //     }
            //   },
            // ),
            sizeH5,
            customListtile(
              title: 'FAQ',
              onTap: () {
                Get.to(() => FaqPage());
              },
            ),
            // sizeH5,
            // customListtile(
            //   title: 'Terms & Conditions',
            //   onTap: () {
            //     Get.to(() => TermsAndCondition());
            //   },
            // ),
            // sizeH5,
            // customListtile(
            //   title: 'Privacy Policy',
            //   onTap: () {
            //     Get.to(() => PrivacyPolicy());
            //   },
            // ),
            sizeH5,
            customListtile(
              title: 'How To Use App',
              onTap: () {
                Get.to(() => HowToUseAppPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  customListtile({
    required title,
    required onTap,
  }) {
    return CustomCardWidget(
      onTap: onTap,
      elevation: 1,
      height: 60,
      width: Get.width,
      child: Padding(
        padding: paddingH20,
        child: Row(
          children: [
            KText(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: black45,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

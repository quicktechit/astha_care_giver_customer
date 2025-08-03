import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/configs/loader.dart';
import 'package:jatri_app/src/controllers/guide%20line/aboutus_controller.dart';
import 'package:jatri_app/src/widgets/appbar/customAppbar.dart';
import 'package:jatri_app/src/widgets/rental_trip_title.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class HowToUseAppPage extends StatefulWidget {
  const HowToUseAppPage({Key? key}) : super(key: key);

  @override
  State<HowToUseAppPage> createState() => _HowToUseAppPageState();
}

class _HowToUseAppPageState extends State<HowToUseAppPage> {
  final AboutUsController _aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    AboutUsController().getAboutUS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              CustomAppBar(appbarTitle: ''),
              Padding(
                padding: paddingH20,
                child: Row(
                  children: [
                    RentalTripTitle(
                      title: 'How To Use App',
                      subTitle: "Here describe how to use our App",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        height: 546,
        child: Obx(
          () => _aboutUsController.isLoading.value
              ? loader()
              : ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    log(_aboutUsController.videoOne.value);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YouTubeVideoPlayer(
                        videoUrl: index == 0
                            ? _aboutUsController.videoOne.value
                            : _aboutUsController.videoTwo.value,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class YouTubeVideoPlayer extends StatelessWidget {
  final String videoUrl;

  YouTubeVideoPlayer({required this.videoUrl});

  // Extracts the video ID from various YouTube URL formats
  String getYouTubeVideoId(String url) {
    Uri uri = Uri.parse(url);

    // Handle youtu.be/<id>
    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.first;
    }

    // Handle youtube.com/watch?v=<id>
    if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v']!;
    }

    // Handle youtube.com/shorts/<id>
    if (uri.pathSegments.contains('shorts') && uri.pathSegments.length > 1) {
      return uri.pathSegments[1];
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    String videoId = getYouTubeVideoId(videoUrl);

    if (videoId.isEmpty) {
      return Center(child: Text("Invalid YouTube URL"));
    }

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {
        // Optional: do something when ready
      },
    );
  }
}


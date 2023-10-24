import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';




class VideoPlayerScreen extends StatefulWidget {
  final String vvideo;
  const VideoPlayerScreen({super.key,required this.vvideo});

  @override
  State<StatefulWidget> createState() => _MainscreenState();
}

class _MainscreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        widget.vvideo,
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: Column(
        children: [

          VisibilityDetector(
            key: ObjectKey(flickManager),
            onVisibilityChanged: (visibility) {
              if (visibility.visibleFraction == 0 && mounted) {
                flickManager.flickControlManager?.autoPause();
              } else if (visibility.visibleFraction == 1) {
                flickManager.flickControlManager?.autoResume();
              }
            },
            child: SizedBox(
              height: 250,
              child: FlickVideoPlayer(
                flickManager: flickManager,
                flickVideoWithControls: const FlickVideoWithControls(
                  closedCaptionTextStyle: TextStyle(fontSize: 8),
                  controls: FlickPortraitControls(),
                ),
                flickVideoWithControlsFullscreen:
                const FlickVideoWithControls(
                  controls: FlickLandscapeControls(),
                ),
              ),
            ),
          ),



        ],
      ),
    );
  }
}
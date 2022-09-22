import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class StartWorkoutVideo extends StatefulWidget {
  final ExerciseData exercise;
  final Function(int) onPlayTapped;
  final Function(int) onPauseTapped;

  const StartWorkoutVideo(
      {Key? key,
      required this.exercise,
      required this.onPlayTapped,
      required this.onPauseTapped})
      : super(key: key);

  @override
  State<StartWorkoutVideo> createState() => _StartWorkoutVideoState();
}

class _StartWorkoutVideoState extends State<StartWorkoutVideo> {
  late final VideoPlayerController _controller;
  final bool isPlayButtonHidden = false;
  late final ChewieController _chewieController;
  Timer? timer;
  Timer? videoTimer;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.exercise.video);
    _controller.initialize();
    _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        autoPlay: false,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        aspectRatio: 15 / 10,
        placeholder: const Center(
          child: CupertinoActivityIndicator(),
        ),
        materialProgressColors: ChewieProgressColors(
            playedColor: AppColors.weightLossContainerColor));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: _createVideoController(),
    );
  }

  Widget _createVideoController() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Theme(
        data: Theme.of(context).copyWith(platform: TargetPlatform.android),
        child: Chewie(
          controller: _chewieController
        ),
      ),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:seventh_prova_flutter/app/models/video_model.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final VideoModel video;
  const CustomVideoPlayer({required this.video, Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => CustomVideoPlayerState();
}

class CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  void initVideoPlayer() async {
    videoPlayerController = VideoPlayerController.network(widget.video.url!);
    await videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true,
      errorBuilder: (context, errorMessage) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Chewie(controller: _chewieController),
      ),
    );
  }
}

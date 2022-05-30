import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class Reproductor extends StatefulWidget {
  final String urlpeli;
  Reproductor({Key? key, required this.urlpeli}) : super(key: key);

  @override
  //_VideoPlayerScreenState createState() => _VideoPlayerScreenState();

  State<Reproductor> createState() => _ReproductorState();
}

class _ReproductorState extends State<Reproductor> {
  late VideoPlayerController _controller;
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.urlpeli)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    print(widget.urlpeli);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

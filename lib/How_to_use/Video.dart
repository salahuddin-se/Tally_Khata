import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: VideoDemo(),
));

class VideoDemo extends StatefulWidget {
  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {

  VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')..initialize().then((_){
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });

      },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}

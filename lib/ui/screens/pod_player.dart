// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PodPlayerTube extends StatefulWidget {
  const PodPlayerTube({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  State<PodPlayerTube> createState() => _PodPlayerTubeState();
}

class _PodPlayerTubeState extends State<PodPlayerTube> {
  late PodPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PodPlayerController(
        playVideoFrom:
            PlayVideoFrom.youtube('https://youtu.be/${widget.videoId}'))
      ..initialise();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PodVideoPlayer(
          controller: _controller,
          alwaysShowProgressBar: false,
        ),
      ),
    );
  }
}

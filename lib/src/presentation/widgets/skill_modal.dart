import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SkillModal extends StatefulWidget {
  SkillModal(
      {super.key,
      required this.name,
      required this.description,
      required this.videoUrl});
  final String name;
  final String description;
  final String videoUrl;
  @override
  State<SkillModal> createState() => _SkillModalState();
}

class _SkillModalState extends State<SkillModal> {
  late VideoPlayerController controller;

  @override
  void initState() {
    setupVideoPlayer();
    super.initState();
  }

  setupVideoPlayer() {
    controller = VideoPlayerController.network(widget.videoUrl);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(9, 20, 40, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(200, 155, 60, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  widget.description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(240, 230, 210, 1),
                  ),
                ),
              ),
              if (controller.value.isInitialized)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromRGBO(200, 155, 60, 1),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                      setState(() {});
                    },
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  ),
                )
              else
                const Center(
                  child: CircularProgressIndicator(),
                ),
              const Text(
                'Tap the video to play/pause',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(200, 155, 60, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

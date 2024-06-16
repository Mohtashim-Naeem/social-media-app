// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
    this.isLeftRight = true,
  });
  final AudioPlayer audioPlayer;
  final bool isLeftRight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isLeftRight,
          child: IconButton(
              onPressed: audioPlayer.seekToNext,
              iconSize: 52.w,
              icon: const Icon(
                Icons.skip_previous_rounded,
                color: Colors.white,
              )),
        ),
        StreamBuilder(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshots) {
              final playerState = snapshots.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (!(playing ?? false)) {
                return IconButton(
                  onPressed: audioPlayer.play,
                  iconSize: 52.w,
                  icon: CircleAvatar(
                    radius: 26.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 30.w,
                    ),
                  ),
                  // const Icon(
                  //   Icons.play_circle_filled_rounded,
                  //   color: Colors.white,
                  // ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: audioPlayer.pause,
                  iconSize: 52.w,
                  icon: CircleAvatar(
                    radius: 26.r,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.pause_rounded,
                      size: 30.w,
                    ),
                  ),
                  //  const Icon(
                  //   Icons.pause_circle_filled_rounded,
                  //   color: Colors.white,
                  // ),
                );
              } else {
                return Icon(
                  size: 52.w,
                  Icons.play_circle_filled_rounded,
                  color: Colors.white,
                );
              }
            }),
        Visibility(
          visible: isLeftRight,
          child: IconButton(
              onPressed: audioPlayer.seekToPrevious,
              iconSize: 52.w,
              icon: const Icon(
                Icons.skip_next_rounded,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}

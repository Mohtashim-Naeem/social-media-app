import 'package:flutter/services.dart';
import 'package:pod_player/pod_player.dart';
import 'package:get/get.dart';

class BrittanyVideoPlayerViewModel extends GetxController {
  late final PodPlayerController controller;
  final url =
      'https://hayatpr.000webhostapp.com/CGI%20Animated%20Short%20Film%20HD%20.mp4';
  // 'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/y2mate.is%20-%20(2%20Hour%20Nature%20Relaxation%20Video)%20A%20Day%20in%20Big%20Sur%2C%20California%201080p%20Relaxation%20Video%20Pure%20Nature-H9vevyszht4-720p-1714564983.mp4?alt=media&token=395d9077-3212-4827-9ea4-dec8c739009b';
  @override
  void onInit() {
    super.onInit();
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        url,
      ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        forcedVideoFocus: true,
      ),
    )..initialise();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}


//better player
/*

class BrittanyVideoPlayerViewModel extends GetxController {
  late BetterPlayerController betterPlayerController;
  final url =
      // 'https://hayatpr.000webhostapp.com/CGI%20Animated%20Short%20Film%20HD%20.mp4';
      'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/y2mate.is%20-%20(2%20Hour%20Nature%20Relaxation%20Video)%20A%20Day%20in%20Big%20Sur%2C%20California%201080p%20Relaxation%20Video%20Pure%20Nature-H9vevyszht4-720p-1714564983.mp4?alt=media&token=395d9077-3212-4827-9ea4-dec8c739009b';
  @override
  void onInit() {
    super.onInit();
    betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 1 / 1,
        autoPlay: true,
        autoDispose: true,
        autoDetectFullscreenAspectRatio: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enableAudioTracks: false,
          enablePip: true,
          enableQualities: false,
          enableSubtitles: false,
        ),
        allowedScreenSleep: false,
        autoDetectFullscreenDeviceOrientation: true,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      ),
    );
    betterPlayerController.setupDataSource(BetterPlayerDataSource.network(url));
  }

  @override
  void onClose() {
    super.onClose();
    betterPlayerController.dispose();
  }
}
*/
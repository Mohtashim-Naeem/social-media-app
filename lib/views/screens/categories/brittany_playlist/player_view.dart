import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/utils/utils.dart';
import 'package:bloom_app/views/components/keep_watching_tile_component.dart';
import 'package:bloom_app/views/components/post_action_component.dart';
import 'package:bloom_app/views/screens/categories/brittany_playlist/metadeta_.dart';
import 'package:bloom_app/views/screens/categories/brittany_playlist/music_actions.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayerViewModel extends GetxController {
  late AudioPlayer player;
  final playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
          Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/Shape%20of%20You%20-%20Ed%20Sheeran%20Karaoke%20No%20Guide%20Melody%20Instrumental.mp3?alt=media&token=cb7134fa-94bb-48ea-8f89-736fe5d45f6f'),
          tag: MediaItem(
            title: "Garden City",
            id: '0',
            artist: 'Thomas Austin',
            artUri: Uri.parse(
                'https://media.istockphoto.com/id/1417752495/photo/african-man-singing-and-gesturing-with-his-hands.jpg?s=612x612&w=0&k=20&c=xoM-DbaDB8_N6-yj2Qp46M8PSSjk9WC4RRkyRzLXDGg='),
            displayDescription:
                'Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada.',
          )),
      AudioSource.uri(
          Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/See%20You%20Again%20ft.%20Charlie%20Puth%20-%20Wiz%20Khalifa%20Karaoke%20With%20Guide%20Melody%20Instrumental.mp3?alt=media&token=4f5f24d1-2879-45a6-9687-06a5d1b779fd'),
          tag: MediaItem(
            title: "Eden Town",
            id: '0',
            artist: 'Austin Shelby',
            artUri: Uri.parse(
                'https://images.unsplash.com/photo-1447789624106-34acdd381c18?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljJTIwYXJ0aXN0fGVufDB8fDB8fHww'),
            displayDescription:
                'Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada.',
          )),
    ],
  );
  letRock(url) async {
    player = AudioPlayer(); // Create a player
    await player.setLoopMode(LoopMode.all);
    await player.setAudioSource(playlist);
    // final duration = await player.setUrl(// Load a URL
    //     url);
    player.play();
  }

  bool isLike = false;
  void giveLike() {
    isLike = !isLike;
    update();
  }

  RxString? songImage; // = ''.obs;
  Stream<PositionData> get positionDataStream => CombineLatestStream.combine3(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position: position,
            bufferedPosition: bufferedPosition,
            duration: duration ?? const Duration()),
      );
  @override
  void onInit() {
    super.onInit();
    letRock(
      'https://hayatpr.000webhostapp.com/Cheap%20Thrills%20-%20Sia%20Karaoke%20%E3%80%90With%20Guide%20Melody%E3%80%91%20Instrumental.mp3',
    );
  }

  @override
  void onClose() {
    super.onClose();
    player.dispose();
  }
}

class MusicPlayerView extends StatelessWidget {
  const MusicPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MusicPlayerViewModel(),
        builder: (controller) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          splashColor: AppColors.black,
                          borderRadius: BorderRadius.circular(50),
                          child: CircleAvatar(
                            // radius: 1000.r,
                            backgroundColor: Colors.white.withOpacity(0.60),
                            child: const Icon(
                              Icons.arrow_back,
                              // size: Utils.isTablet(context) ? 30.w : 25.w,
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(top: 50),
                  ),
                )),
            extendBodyBehindAppBar: true,
            body: Stack(
              fit: StackFit.expand,
              children: [
                // ColoredBox(color: Colors.black.withOpacity(0.60)),
                //  Obx(() =>
                //   controller.songImage?.value == null
                //       ? ColoredBox(color: Colors.black.withOpacity(0.60))
                //       :

                Image.asset(
                  'assets/images/music-player.png',
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        const Color(0xff09092D).withOpacity(0.60),
                        const Color(0xff0C0C3B),
                      ])),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpacing(100.h),
                        Column(
                          children: [
                            StreamBuilder(
                                stream: controller.player.sequenceStateStream,
                                builder: (context, snapshots) {
                                  final state = snapshots.data;
                                  if (state?.sequence.isEmpty ?? false) {
                                    const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  final dynamic metaData =
                                      state?.currentSource?.tag as MediaItem?;
                                  if (metaData != null) {
                                    // `currentSource` is not null, proceed with accessing its properties
                                    return MusicMetaDetaWidget(
                                      songTitle: metaData.title,
                                      songImage: metaData.artUri.toString(),
                                      artistName:
                                          metaData.artist ?? "Anonymous",
                                      songDesc:
                                          metaData.displayDescription ?? "",
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  // return MusicMetaDetaWidget(
                                  //     songTitle: metaData.title,
                                  //     songImage: metaData.artUri.toString(),
                                  //     artistName: metaData.artist ?? "Anonimous",
                                  //     songDesc:
                                  //         metaData.displayDescription ?? "");
                                }),
                          ],
                        ).paddingSymmetric(horizontal: 16.w),
                        VerticalSpacing(29.h),
                        Column(
                          children: [
                            StreamBuilder(
                                stream: controller.positionDataStream,
                                builder: (context, snapshot) {
                                  final positionData = snapshot.data;

                                  return ProgressBar(
                                    thumbRadius:
                                        Utils.isTablet(context) ? 12.r : 10.r,
                                    barHeight:
                                        Utils.isTablet(context) ? 5.h : 2.h,
                                    baseBarColor: const Color(0xffbbbbbb),
                                    bufferedBarColor:
                                        AppColors.magicMint.withOpacity(0.5),
                                    thumbColor: AppColors.magentaPink,
                                    progressBarColor:
                                        AppColors.lightMagentaPink,
                                    timeLabelTextStyle: Fonts.noto(context,
                                        AppColors.gray, 14, FontWeight.w400),
                                    progress: positionData?.position ??
                                        const Duration(),
                                    buffered: positionData?.bufferedPosition ??
                                        const Duration(),
                                    total: positionData?.duration ??
                                        const Duration(),
                                    onSeek: controller.player.seek,
                                  );
                                }),
                            Center(
                                child:
                                    Controls(audioPlayer: controller.player)),
                            VerticalSpacing(29.h),
                            PostActionComponent(
                                isWhite: true,
                                isLiked: controller.isLike,
                                likeOnTap: controller.giveLike,
                                totalComments: '20',
                                totalLikes: '10'),
                            Divider(
                              thickness: 1,
                              // indent: 16,
                              // endIndent: 16,
                              color: AppColors.white.withOpacity(0.50),
                            ),
                            VerticalSpacing(26.h),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Keep Watching',
                                style: Fonts.noto(context, AppColors.white, 13,
                                    FontWeight.w600),
                              ),
                            ),
                            VerticalSpacing(17.h),
                            ...List.generate(
                              7,
                              (index) => const KeepWatchingTileComponent(
                                image: AppImages.adioLeading,
                                title: 'Finding Clarity in Life Chaos',
                                desc:
                                    'Join Brittany in this insightful talk as she expl...',
                                videoInfo: 'videoInfo',
                                isPlaylist: true,
                              ),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class PositionData {
  PositionData(
      {required this.position,
      required this.bufferedPosition,
      required this.duration});
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

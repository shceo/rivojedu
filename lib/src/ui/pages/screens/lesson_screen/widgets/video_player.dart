import 'dart:async';
import 'package:edu/generated/assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem(
      {super.key, required this.videoPath, required this.videoChanged});

  final String videoPath;
  final ValueChanged<bool> videoChanged;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController videoController;
  TextEditingController controller = TextEditingController();
  late AnimationController animationController;
  Timer? _hideTimer;
  bool isPlaying = false;
  bool isSeeking = false;
  bool isShowButton = true;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
          ..initialize().then((_) {
            setState(() {});
          });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    videoController.addListener(() {
      if (!isSeeking && !videoController.value.isPlaying && isPlaying) {
        animationController.reverse();
        isPlaying = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    videoController.dispose();
    animationController.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFullScreen ? MediaQuery.of(context).size.height : 189.h,
      width: double.infinity,
      child: GestureDetector(
        onTap: toggleControlsVisibility,
        onDoubleTapDown: (details) {
          final double screenMiddle = MediaQuery.of(context).size.width / 2;
          if (details.globalPosition.dx < screenMiddle) {
            seekVideo(
              videoController.value.position - const Duration(seconds: 15),
            );
          } else {
            seekVideo(
              videoController.value.position + const Duration(seconds: 15),
            );
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(videoController))
                  : const Center(child: CircularProgressIndicator()),
            ),
            if (isShowButton || !isFullScreen) ...[
              Positioned(
                top: 5.sp,
                left: 0.sp,
                child: IconButton(
                  onPressed: () {
                    if (isFullScreen) {
                      SystemChrome.setEnabledSystemUIMode(
                          SystemUiMode.edgeToEdge);
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.portraitUp]);
                    }
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    Assets.vectorsArrowBack,
                    height: 20.sp,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder(
                  valueListenable: videoController,
                  builder: (context, value, child) {
                    return Container(
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 5.sp),
                      child: Row(
                        children: [
                          Text(
                            videoDuration(duration: value.position),
                            style: TextStyle(
                              color: white,
                              fontSize: 12.sp,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 8.h,
                              child: VideoProgressIndicator(
                                videoController,
                                allowScrubbing: true,
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
                              ),
                            ),
                          ),
                          Text(
                            videoDuration(duration: value.duration),
                            style: TextStyle(
                              color: white,
                              fontSize: 12.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: toggleFullScreen,
                            child: Icon(
                              isFullScreen
                                  ? Icons.fullscreen_exit
                                  : Icons.fullscreen,
                              color: white,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              if (videoController.value.isInitialized)
                Container(
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(.1)),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isPlaying) {
                          videoController.pause();
                          animationController.reverse();
                        } else {
                          videoController.play();
                          animationController.forward();
                        }
                        isPlaying = !isPlaying;
                      });
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: animationController,
                      size: isFullScreen ? 25.sp : 45.sp,
                      color: white,
                    ),
                  ),
                ),
              if (!isFullScreen)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    height: 1.sp,
                    color: blackGrey,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
      if (isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft]);
        startHideTimer(
          callback: () {
            setState(() {
              isShowButton = false;
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
            });
          },
          timer: _hideTimer,
        );
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        _hideTimer?.cancel();
      }
    });
  }

  void toggleControlsVisibility() {
    setState(() {
      isShowButton = !isShowButton;
      if (isFullScreen) {
        if (isShowButton) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          startHideTimer(
            callback: () {
              setState(() {
                isShowButton = false;
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
              });
            },
            timer: _hideTimer,
          );
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
          _hideTimer?.cancel();
        }
      }
    });
  }

  void seekVideo(Duration position) {
    setState(() {
      isSeeking = true;
    });

    videoController.seekTo(position).then((_) {
      setState(() {
        isSeeking = false;
      });
    });
  }
}

String videoDuration({required Duration duration}) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final String hours = twoDigits(duration.inHours);
  final String minutes = twoDigits(duration.inMinutes.remainder(60));
  final String seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(":");
}

void startHideTimer({required VoidCallback callback, required Timer? timer}) {
  timer?.cancel();
  timer = Timer(const Duration(seconds: 5), () {
    callback.call();
  });
}

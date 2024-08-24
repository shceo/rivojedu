import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../assets/constants/common_assets.dart';
import '../../../../theme/app_themes.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({
    super.key,
    required this.togglePlayPause,
    required this.controller,
    required this.isPlaying,
  });

  final VoidCallback togglePlayPause;
  final VideoPlayerController controller;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                Container(color: grey),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: togglePlayPause,
                    icon: SvgPicture.asset(
                      isPlaying == false
                          ? CommonAssets.play
                          : CommonAssets.pouse,
                      width: 49.w,
                      colorFilter: const ColorFilter.mode(
                        white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

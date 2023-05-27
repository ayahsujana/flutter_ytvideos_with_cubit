// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'package:sakuralifestoryschool/ui/screens/pod_player.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';

import '../../core/network/rest_api.dart';
import '../../core/utils/constant.dart';
import '../widgets/icon_detail.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.video,
    this.bannerAd,
  }) : super(key: key);

  final Video video;
  final BannerAd? bannerAd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: PodPlayerTube(
              videoId: video.url,
            ),
          ),
          bannerAd != null ? Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: SizedBox(
                width: bannerAd!.size.width.toDouble(),
                height: bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: bannerAd!,
                ),
              ),
            ),
          ) : SizedBox(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                video.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: textStyle14(),
              ),
            ),
          ),
          Divider(
            height: 5,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ColumIcon(
                        icon: Icons.remove_red_eye,
                        text: getSee(video.engagement.viewCount.toString())),
                    ColumIcon(
                        icon: Icons.thumb_up_alt_outlined,
                        text: getSee(video.engagement.likeCount.toString())),
                  ],
                ),
                ColumIcon(
                    icon: Icons.publish_rounded,
                    text: DateFormat.yMMMd().format(video.publishDate!)),
                OutlinedButton(
                  style:
                      OutlinedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    shareTo(
                        "Hi, I'm watching a video ${video.title} from app $appName download on play store https://play.google.com/store/apps/details?id=${ApiURL.packageName}");
                  },
                  child: Text("SHARE", style: textStyle14()),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: SizedBox(
                    width: 175,
                    child: Text(video.author,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: textStyle16(color: Colors.amber)),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      getToLaunch(
                          "https://www.youtube.com/channel/${video.channelId}");
                    },
                    child: Text("SUBSCRIBE", style: textStyle14())),
              ],
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              video.description,
              textAlign: TextAlign.center,
              maxLines: 10,
              style: textStyle14(),
            ),
          ),
        ],
      ),
    );
  }
}

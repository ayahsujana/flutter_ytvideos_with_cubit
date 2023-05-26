// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/ui/widgets/image_widget.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';
import 'package:youtube_data_api/models/video.dart';

import '../screens/detail.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({
    Key? key,
    required this.video,
  }) : super(key: key);
  final List<Video> video;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: video.length,
        itemBuilder: (context, index) {
          Video videos = video[index];
          return InkWell(
            onTap: () async {
              Get.to(DetailScreen(), arguments: videos.videoId);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      imgTrending(videos.thumbnails![0].url!),
                      Positioned(
                        bottom: 4.0,
                        right: 4.0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: (videos.duration == "Live")
                                  ? Colors.red.withOpacity(0.88)
                                  : Colors.black54,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            videos.duration ?? '',
                            style: textStyle11(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      videos.title ?? '',
                      textAlign: TextAlign.center,
                      style: textStyle14(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          videos.channelName ?? '',
                          textAlign: TextAlign.right,
                          style: textStyle11(color: Colors.amberAccent),
                        ),
                        const Text(' '),
                        const Center(
                            child: Icon(
                          Icons.do_not_disturb_on,
                          size: 10,
                          color: Colors.white38,
                        )),
                        const Text(' '),
                        Text(
                          videos.views ?? '',
                          style: textStyle12(color: Colors.greenAccent),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

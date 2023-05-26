// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/ui/widgets/image_widget.dart';
import 'package:sakuralifestoryschool/ui/widgets/other_widget.dart';

import '../../core/models/video_channel.dart';

class ChannelVideosPage extends StatelessWidget {
  const ChannelVideosPage({
    Key? key,
    required this.vChannel,
  }) : super(key: key);

  final VideosChannelModelDatum vChannel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: vChannel.data.length,
        itemBuilder: (context, index) {
          ItemVideos videos = vChannel.data[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                imgMedium(videos.ids),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    videos.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: textStyle12(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

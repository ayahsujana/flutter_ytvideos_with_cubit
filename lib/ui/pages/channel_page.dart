// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakuralifestoryschool/core/models/channel_model.dart';
import 'package:sakuralifestoryschool/ui/screens/video_channel.dart';

import '../widgets/other_widget.dart';

class ChannelPage extends StatelessWidget {
  ChannelPage({
    Key? key,
    required this.channel,
  }) : super(key: key);

  final Datums channel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: channel.channels.length,
      itemBuilder: (context, index) {
        var ch = channel.channels[index];
        return InkWell(
          onTap: () => Get.to(ChannelVideosScreen(),
              arguments: {'channelId': ch.ids, 'nameChannel': ch.title}),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(channel.channels[index].thumb),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  channel.channels[index].title,
                  style: textStyle18(color: Colors.cyan),
                ),
                Text(
                  channel.channels[index].description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: textStyle11(),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        thickness: 2,
      ),
    );
  }
}

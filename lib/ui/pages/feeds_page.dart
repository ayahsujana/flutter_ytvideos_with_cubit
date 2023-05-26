// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sakuralifestoryschool/core/models/feed_model.dart';
import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/ui/widgets/image_widget.dart';

import '../widgets/other_widget.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({
    Key? key,
    required this.feeds,
  }) : super(key: key);

  final DaFeeds feeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: feeds.feeds.length,
        itemBuilder: (context, index) {
          ItemVideos feed = feeds.feeds[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                imgMedium(feed.ids),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    feed.title,
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

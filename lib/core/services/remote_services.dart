// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;

import 'package:sakuralifestoryschool/core/models/channel_model.dart';
import 'package:sakuralifestoryschool/core/models/feed_model.dart';
import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/core/models/video_channel.dart';
import 'package:sakuralifestoryschool/core/network/rest_api.dart';

class ApiServices {
  final http.Client client;
  ApiServices({
    required this.client,
  });

  Map<String, String> header = {
    'x-identifier-app': ApiURL.appKey,
    'x-origin-app': ApiURL.packageName,
  };

  Future<HomeModel> getHome() async {
    try {
      final res = await client.get(Uri.parse(ApiURL.homeUrl), headers: header);
      if (res.statusCode == 200) {
        return homeModelFromJson(res.body);
      } else {
        return Future.error(res.body);
      }
    } catch (e) {
      return Future(() => Future.error(e));
    }
  }

  Future<FeedsModel> getFeed() async {
    try {
      final res = await client.post(Uri.parse(ApiURL.feedsUrl), headers: header);
      if (res.statusCode == 200) {
        return feedsModelFromJson(res.body);
      } else {
        return Future.error(res.body);
      }
    } catch (e) {
      return Future(() => Future.error(e));
    }
  }

  Future<ChannelModel> getChannel() async {
    try {
      final res =
          await client.get(Uri.parse(ApiURL.channelUrl), headers: header);
      if (res.statusCode == 200) {
        return channelModelFromJson(res.body);
      } else {
        return Future.error(res.body);
      }
    } catch (e) {
      return Future(() => Future.error(e));
    }
  }

  Future<VideosChannelModel> getMoreVideoChannel(
      String channelId, int page) async {
    try {
      final res = await client.post(
          Uri.parse('${ApiURL.moreChannelWithPage}$page'),
          body: {"channel_id": channelId},
          headers: header);
      if (res.statusCode == 200) {
        return videosChannelModelFromJson(res.body);
      } else {
        return Future.error(res.body);
      }
    } catch (e) {
      return Future(() => Future.error(e));
    }
  }
}

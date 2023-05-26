// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakuralifestoryschool/core/models/video_channel.dart';

import '../../network/rest_api.dart';

part 'videos_channel_state.dart';

Map<String, String> header = {
  'x-identifier-app': ApiURL.appKey,
  'x-origin-app': ApiURL.packageName,
};

final _dio = Dio(BaseOptions(
    baseUrl: 'https://watchedflix.com/ytvideos/api/v1/',
    headers: header,
    validateStatus: (_) => true));

class VideosChannelCubit extends Cubit<VideosChannelState> {
  VideosChannelCubit() : super(VideosChannelInitial());

  int _pageNo = 0;
  bool _canLoadMore = true;

  bool get canLoadMore => _canLoadMore;

  final datum = <VideosChannelModelDatum>[];

  Future<void> loadMoreVideos(String channelId) async {
    if (!_canLoadMore) return;

    try {
      emit(_pageNo == 0
          ? VideosChannelLoading()
          : VideosChannelLoadingMore(datum));

      await Future.delayed(Duration(seconds: 2));

      final response = await _dio.post('channel?page=', queryParameters: {
        'channel_id': channelId,
        'page': ++_pageNo,
      });

      if (response.statusCode != HttpStatus.ok && response.data['success'])
        throw response.data['message'];
      final dataList = List<VideosChannelModelDatum>.from(response.data["data"]
          .map((x) => VideosChannelModelDatum.fromJson(x)));

      if (dataList.isEmpty) {
        _canLoadMore = false;
      }

      datum.addAll(dataList);
      emit(VideosChannelLoaded(datum));
    } catch (e) {
      emit(VideosChannelError(e.toString()));
    }
  }
}

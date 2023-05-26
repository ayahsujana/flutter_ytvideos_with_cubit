// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sakuralifestoryschool/core/models/feed_model.dart';
import 'package:sakuralifestoryschool/core/services/remote_services.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit(
    this.apiServices,
  ) : super(FeedInitial());

  final ApiServices apiServices;

  Future<void> getFeedsVideos() async {
    try {
      emit(FeedLoading());
      final feeds = await apiServices.getFeed();
      emit(FeedLoaded(feed: feeds));
    } catch (e) {
      emit(FeedError(message: e.toString()));
    }
  }
}

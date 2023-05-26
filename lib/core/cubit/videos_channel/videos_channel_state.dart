// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'videos_channel_cubit.dart';

abstract class VideosChannelState extends Equatable {
  const VideosChannelState();

  @override
  List<Object> get props => [];
}

class VideosChannelInitial extends VideosChannelState {}

class VideosChannelLoading extends VideosChannelState {}

class VideosChannelLoadingMore extends VideosChannelState {
  final List<VideosChannelModelDatum> datum;
  VideosChannelLoadingMore(this.datum);
}

class VideosChannelLoaded extends VideosChannelState {
  final List<VideosChannelModelDatum> datum;
  VideosChannelLoaded(this.datum);
}

class VideosChannelError extends VideosChannelState {
  final String message;
  VideosChannelError(this.message);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final FeedsModel feed;
  FeedLoaded({
    required this.feed,
  });

  @override
  List<Object> get props => [feed];
}

class FeedError extends FeedState {
  final String message;
  FeedError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

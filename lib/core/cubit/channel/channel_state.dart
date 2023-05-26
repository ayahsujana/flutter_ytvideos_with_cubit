// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'channel_cubit.dart';

abstract class ChannelState extends Equatable {
  const ChannelState();

  @override
  List<Object> get props => [];
}

class ChannelInitial extends ChannelState {}

class ChannelLoading extends ChannelState {}

class ChannelLoaded extends ChannelState {
  final ChannelModel channel;
  ChannelLoaded({
    required this.channel,
  });

  @override
  List<Object> get props => [channel];
}

class ChannelError extends ChannelState {
  final String message;
  ChannelError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:sakuralifestoryschool/core/models/channel_model.dart';
import 'package:sakuralifestoryschool/core/services/remote_services.dart';

part 'channel_state.dart';

class ChannelCubit extends Cubit<ChannelState> {
  ChannelCubit(
    this.apiServices,
  ) : super(ChannelInitial());

  final ApiServices apiServices;

  Future get getChannel => getChannels();

  Future<void> getChannels() async {
    try {
      emit(ChannelLoading());
      final channel = await apiServices.getChannel();
      emit(ChannelLoaded(channel: channel));
    } catch (e) {
      emit(ChannelError(message: e.toString()));
    }
  }
}

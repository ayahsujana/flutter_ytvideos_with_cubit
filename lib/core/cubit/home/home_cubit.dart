// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakuralifestoryschool/core/models/home_model.dart';
import 'package:sakuralifestoryschool/core/services/remote_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.apiServices,
  ) : super(HomeInitial());

  final ApiServices apiServices;

  Future<void> getHomeVideos() async {
    try {
      emit(HomeLoading());
      final home = await apiServices.getHome();
      emit(HomeLoaded(home: home));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}

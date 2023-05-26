// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel home;
  HomeLoaded({
    required this.home,
  });

  @override
  List<Object> get props => [home];
}

class HomeError extends HomeState {
  final String message;
  HomeError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final Video video;
  DetailLoaded({
    required this.video,
  });

  @override
  List<Object> get props => [video];
}

class DetailError extends DetailState {
  final String message;
  DetailError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  late Video _video;

  Video get video => _video;

  void explodeLink(String id) async {
    YoutubeExplode explode = YoutubeExplode();
    try {
      emit(DetailLoading());
      Video video = await explode.videos.get('https://youtube.com/watch?v=$id');
      emit(DetailLoaded(video: video));
      explode.close();
    } catch (e) {
      emit(DetailError(message: e.toString()));
    }
  }
}

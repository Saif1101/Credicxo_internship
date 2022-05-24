import 'package:credixco_intern/application/domain/repositories/music_remote_repository.dart';
import 'package:credixco_intern/application/domain/usecases/usecase.dart';
import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:dartz/dartz.dart';

class GetTrackLyrics extends UseCase<TrackLyricsModel, String>{
  final MusicRemoteRepository repository;

  GetTrackLyrics(this.repository);

  @override
  Future<Either<AppError, TrackLyricsModel>> call(String params) async {
    return await repository.getTrackLyrics(params);
  }
}
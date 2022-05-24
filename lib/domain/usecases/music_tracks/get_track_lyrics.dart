import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:credixco_intern/domain/repositories/music_repository.dart';
import 'package:credixco_intern/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetTrackLyrics extends UseCase<TrackLyricsModel, String> {
  final MusicRepository repository;

  GetTrackLyrics(this.repository);

  @override
  Future<Either<AppError, TrackLyricsModel>> call(String params) async {
    return await repository.getTrackLyrics(params);
  }
}

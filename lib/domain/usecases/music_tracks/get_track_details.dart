import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:credixco_intern/domain/repositories/music_repository.dart';
import 'package:credixco_intern/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetTrackDetails extends UseCase<TrackModel, String> {
  final MusicRepository repository;

  GetTrackDetails(this.repository);

  @override
  Future<Either<AppError, TrackModel>> call(String params) async {
    return await repository.getTrackDetails(params);
  }
}

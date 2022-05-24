import 'package:credixco_intern/application/domain/repositories/music_remote_repository.dart';
import 'package:credixco_intern/application/domain/usecases/usecase.dart';
import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:dartz/dartz.dart';

class GetTrackDetails extends UseCase<TrackModel, String>{
  final MusicRemoteRepository repository;

  GetTrackDetails(this.repository);

  @override
  Future<Either<AppError, TrackModel>> call(String params) async {
    return await repository.getTrackDetails(params);
  }
}
import 'package:credixco_intern/application/domain/repositories/music_remote_repository.dart';
import 'package:credixco_intern/application/domain/usecases/usecase.dart';
import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:dartz/dartz.dart';

class GetTracksFromChart extends UseCase<List<TrackModel>, void>{
  final MusicRemoteRepository repository;

  GetTracksFromChart(this.repository);

  @override
  Future<Either<AppError, List<TrackModel>>> call(void params) async {
     return await repository.getTracksFromChart();
  } 
}
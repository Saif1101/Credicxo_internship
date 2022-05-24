import 'dart:io';

import 'package:credixco_intern/data/data_sources/music_remote_source.dart';
import 'package:credixco_intern/data/models/app_error.dart';
import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:dartz/dartz.dart';

abstract class MusicRepository {
  Future<Either<AppError, List<TrackModel>>> getTracksFromChart();
  Future<Either<AppError, TrackModel>> getTrackDetails(String trackID);
  Future<Either<AppError, TrackLyricsModel>> getTrackLyrics(String trackID);

}

class MusicRemoteRepositoryImpl extends MusicRepository {
  final MusicRemoteSource remoteSource;


  MusicRemoteRepositoryImpl(this.remoteSource);

  @override
  Future<Either<AppError, TrackModel>> getTrackDetails(String trackID) async {
    try {
      final track = await remoteSource.getTrackDetails(trackID);
      return Right(track);
    } on SocketException {
      return Left(AppError('Error connecting to the internet.'));
    } on Exception catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, TrackLyricsModel>> getTrackLyrics(
      String trackID) async {
    try {
      final trackLyrics = await remoteSource.getTrackLyrics(trackID);
      return Right(trackLyrics);
    } on SocketException {
      return Left(AppError('Error connecting to the internet.'));
    } on Exception catch (e) {
      return Left(AppError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<TrackModel>>> getTracksFromChart() async {
    try {
      final tracksFromChart = await remoteSource.getTracksFromChart();
    
      return Right(tracksFromChart);
    } on SocketException {
      return Left(AppError('Error connecting to the internet.'));
    } on Exception catch (e) {
      return Left(AppError(e.toString()));
    }
  }

}

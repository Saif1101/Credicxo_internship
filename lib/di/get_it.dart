import 'package:credixco_intern/application/blocs/home/home_bloc.dart';
import 'package:credixco_intern/application/blocs/track_details/track_details_bloc.dart';

import 'package:credixco_intern/application/journeys/home/track_details_page.dart';
import 'package:credixco_intern/data/core/API_client.dart';
import 'package:credixco_intern/data/data_sources/music_remote_source.dart';
import 'package:credixco_intern/domain/repositories/music_repository.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_track_details.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_track_lyrics.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_tracks_from_chart.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MusicRemoteSource>(
      () => MusicRemoteSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MusicRepository>(
      () => MusicRemoteRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTracksFromChart>(
      () => GetTracksFromChart(getItInstance()));
  getItInstance.registerLazySingleton<GetTrackDetails>(
      () => GetTrackDetails(getItInstance()));
  getItInstance.registerLazySingleton<GetTrackLyrics>(
      () => GetTrackLyrics(getItInstance()));

  getItInstance.registerFactory<HomeBloc>(
      () => HomeBloc(getTracksFromChart: getItInstance()));
  getItInstance.registerFactory<TrackDetailsBloc>(() => TrackDetailsBloc(
      getTrackLyrics: getItInstance(), getTrackDetails: getItInstance()));
}

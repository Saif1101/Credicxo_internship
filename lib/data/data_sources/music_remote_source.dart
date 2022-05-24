import 'package:credixco_intern/data/core/API_client.dart';
import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:credixco_intern/data/models/track_model.dart';

abstract class MusicRemoteSource{
  Future<List<TrackModel>> getTracksFromChart(); 
  Future<TrackModel> getTrackDetails(String trackID); 
  Future<TrackLyricsModel> getTrackLyrics(String trackID);  
}

class MusicRemoteSourceImpl extends MusicRemoteSource{
  final ApiClient _client;

  MusicRemoteSourceImpl(this._client);

  @override
  Future<List<TrackModel>> getTracksFromChart() async {
    final response = await _client.get('chart.tracks.get');
    final tracksFromChart = TrackModel.tracksFromChart(response);
    print('Tracks fetched: ${tracksFromChart.length}');
    return tracksFromChart;
  }

  @override
  Future<TrackModel> getTrackDetails(String trackID) async {
    final response = await _client.get('track.get', params:  {'track_id':trackID});
    final track = TrackModel.fromJson(response['message']['body']['track']);
    return track;
  }

  @override
  Future<TrackLyricsModel> getTrackLyrics(String trackID) async {
    final response = await _client.get('track.lyrics.get',params:  {'track_id':trackID});
    final trackLyrics = TrackLyricsModel.fromJson(response);
    return trackLyrics;
  }}
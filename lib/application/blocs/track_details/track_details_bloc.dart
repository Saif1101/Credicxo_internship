import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_track_details.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_track_lyrics.dart';

import 'package:equatable/equatable.dart';
import 'package:credixco_intern/utilities/extensions.dart';

part 'track_details_event.dart';
part 'track_details_state.dart';

class TrackDetailsBloc extends Bloc<TrackDetailsEvent, TrackDetailsState> {
  final GetTrackDetails getTrackDetails; 
  final GetTrackLyrics getTrackLyrics;

  TrackDetailsBloc({required this.getTrackDetails,required this.getTrackLyrics}) : super(TrackDetailsInitial()) {
    on<LoadTrackDetailsEvent>(_onLoadTrackDetailsEvent);
  }

  Future<void> _onLoadTrackDetailsEvent(
    LoadTrackDetailsEvent event, 
    Emitter<TrackDetailsState> emit
    ) async {
      
      final trackDetailsResponse = await getTrackDetails(event.trackID);
      final trackLyricResponse = await getTrackLyrics(event.trackID);

      if(trackDetailsResponse.isRight() && trackLyricResponse.isRight()){
       emit(
         TrackDetailsLoaded(trackDetailsResponse.asRight(), trackLyricResponse.asRight())
       );
      }
      else{
        emit(TrackDetailsError(errorMessage: 'Error Occured'));
      }
  }
}


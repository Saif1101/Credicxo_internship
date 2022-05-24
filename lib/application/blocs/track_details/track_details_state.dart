part of 'track_details_bloc.dart';

abstract class TrackDetailsState extends Equatable {
  const TrackDetailsState();
  
  @override
  List<Object> get props => [];
}

class TrackDetailsInitial extends TrackDetailsState {}

class TrackDetailsLoading extends TrackDetailsState{}

class TrackDetailsLoaded extends TrackDetailsState{
  final TrackModel track; 
  final TrackLyricsModel trackLyrics;

  const TrackDetailsLoaded(this.track, this.trackLyrics);

  @override
  List<Object> get props => [track, trackLyrics];
}

class TrackDetailsError extends TrackDetailsState{
  final String errorMessage;

  const TrackDetailsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage]; 

}

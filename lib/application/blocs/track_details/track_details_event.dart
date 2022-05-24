part of 'track_details_bloc.dart';

abstract class TrackDetailsEvent extends Equatable {
  const TrackDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadTrackDetailsEvent extends TrackDetailsEvent{
  final String trackID;

  const LoadTrackDetailsEvent(this.trackID); 

  @override
  
  List<Object> get props => [trackID];

 
}


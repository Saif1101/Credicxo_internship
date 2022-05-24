part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState{
  final List<TrackModel> tracks;

  const HomeLoaded(this.tracks);

  @override

  List<Object> get props => [tracks]; 
  
}

class HomeLoading extends HomeState{}

class HomeError extends HomeState{
  final String errorMessage;

  const HomeError(this.errorMessage); 

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
  
}

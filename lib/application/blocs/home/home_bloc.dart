

import 'package:credixco_intern/data/models/track_model.dart';
import 'package:credixco_intern/domain/usecases/music_tracks/get_tracks_from_chart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTracksFromChart getTracksFromChart; 
  
  HomeBloc({required this.getTracksFromChart}) : super(HomeInitial()) {
    on<LoadHomeEvent>(_onLoadHomeEvent); 
  }

  Future<void>_onLoadHomeEvent(
    LoadHomeEvent event, 
    Emitter<HomeState> emit, 
  ) async {
    emit(HomeLoading()); 
    final response = await getTracksFromChart(null); 
    emit(response.fold(
      (l) => HomeError(l.errorMessage), 
      (r) => HomeLoaded(r)
      ));
  }
}

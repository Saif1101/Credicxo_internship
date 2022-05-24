import 'package:credixco_intern/application/blocs/track_details/track_details_bloc.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:credixco_intern/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetailsPage extends StatefulWidget {
  const TrackDetailsPage({Key? key, required this.track}) : super(key: key);

  final TrackModel track;

  static const routeName = '/track-details';

  static Route route(TrackModel track) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => TrackDetailsPage(
        track: track,
      ),
    );
  }

  @override
  State<TrackDetailsPage> createState() => _TrackDetailsPageState();
}

class _TrackDetailsPageState extends State<TrackDetailsPage> {
  late TrackDetailsBloc trackDetailsBloc;

  @override
  void initState() {
    super.initState();
    trackDetailsBloc = getItInstance<TrackDetailsBloc>();
    trackDetailsBloc.add(LoadTrackDetailsEvent(widget.track.trackId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider.value(
          value: trackDetailsBloc,
          child: BlocBuilder<TrackDetailsBloc, TrackDetailsState>(
            builder: (context, state) {
             
              if(state is TrackDetailsLoaded){
                return SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWithText(header:'Name' ,body: state.track.trackName ?? 'Untitled'),
                    HeaderWithText(header:'Artist' ,body: state.track.artistName ?? "Unnamed", ),
                    HeaderWithText(header:'Album Name' ,body: state.track.albumName ?? 'Unnamed', ), 
                    HeaderWithText(header:'Explicit' ,body: state.track.explicit==0?'False':'True', ),
                    HeaderWithText(header: 'Rating', body: state.track.trackRating.toString()), 
                    HeaderWithText(header: 'Lyrics', body: state.trackLyrics.lyricsBody ?? 'Lyrics Unvailable')
                  ],
                              ),
                );
              } else if (state is TrackDetailsLoading || state is TrackDetailsInitial){
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              } else if (state is TrackDetailsError){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.errorMessage), 
                      ElevatedButton.icon(onPressed: ()=>trackDetailsBloc.add(LoadTrackDetailsEvent(state.errorMessage)), icon: Icon(Icons.replay_outlined), label: const Text('Retry'))
                    ],
                    ),
                );
              }
              return Center(
            child: Text('Undefined state in TrackDetailsPage $state'),
          );
            },
          ),
        ),
      ),
    );
  }
}

class HeaderWithText extends StatelessWidget {
  final String header; 
  final String body; 
  const HeaderWithText({
    Key? key, required this.header, required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),), 
          Text(body, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),)
        ],
      ),
    );
  }
}

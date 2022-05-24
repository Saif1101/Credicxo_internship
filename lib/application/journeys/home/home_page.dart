import 'package:credixco_intern/application/blocs/home/home_bloc.dart';
import 'package:credixco_intern/application/journeys/home/track_card.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:credixco_intern/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = getItInstance<HomeBloc>();
    homeBloc.add(LoadHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider.value(
        value: homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          } else if (state is HomeLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
                itemCount: state.tracks.length,
                itemBuilder: (context, index) {
                  TrackModel track = state.tracks.elementAt(index);
                  return TrackCard(track: track);
                });
          } else if (state is HomeError) {
            return Center(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.errorMessage), 
                    ElevatedButton.icon(onPressed: ()=>homeBloc.add(LoadHomeEvent()), icon: Icon(Icons.replay_outlined), label: const Text('Retry'))
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Text('Undefined state in homepage $state'),
          );
        }),
      ),
    ));
  }
}



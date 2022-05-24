import 'dart:async';

import 'package:credixco_intern/application/journeys/home/home_page.dart';
import 'package:credixco_intern/config/app_router.dart';
import 'package:credixco_intern/data/core/API_client.dart';
import 'package:credixco_intern/data/data_sources/music_remote_source.dart';
import 'package:credixco_intern/data/models/track_lyrics_model.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'di/get_it.dart' as getIt; 



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   unawaited(getIt.init());
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
    );
  }
}


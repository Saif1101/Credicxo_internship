import 'package:credixco_intern/application/journeys/home/home_page.dart';
import 'package:credixco_intern/application/journeys/home/track_details_page.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomePage.route();
      case '/home': 
        return HomePage.route(); 
      case '/track-details': 
        return TrackDetailsPage.route(settings.arguments as TrackModel);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
            ));
  }
}
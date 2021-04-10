import 'package:animal_age/config/routes/routing_arguments.dart';
import 'package:animal_age/config/routes/routing_constants.dart';
import 'package:animal_age/views/details_view.dart';
import 'package:animal_age/views/home_view.dart';
import 'package:animal_age/views/result_view.dart';
import 'package:animal_age/views/undefined_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Here we'll handle all the routing
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => Home());
    case DetailViewRoute:
      // var argument = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => DetailView(
            // argument: argument,
            ),
      );
    case ResultViewRoute:
      ResultViewArguments _resultViewArguments = settings.arguments;
      // var _animalAge = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => ResultView(
          resultViewArguments: _resultViewArguments,
          // animalAge: _animalAge,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}

import 'package:animal_age/config/routes/routing_constants.dart';
import 'package:animal_age/config/routes/router.dart' as router;
import 'package:animal_age/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Age',
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeViewRoute,
      theme: AppTheme.myTheme,
    );
  }
}

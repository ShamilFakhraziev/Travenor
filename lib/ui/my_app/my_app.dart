import 'package:flutter/material.dart';
import 'package:travel_app/ui/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final mainNavigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travenor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
    );
  }
}

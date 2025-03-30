import 'package:flutter/material.dart';
import 'package:travel_app/ui/auth/forgot_password_screen.dart';
import 'package:travel_app/ui/auth/reset_password_verification_screen.dart';
import 'package:travel_app/ui/auth/sign_in_screen.dart';
import 'package:travel_app/ui/auth/sign_up_screen.dart';
import 'package:travel_app/ui/destination/destination_details_widget.dart';
import 'package:travel_app/ui/get_started/hello_screen.dart';
import 'package:travel_app/ui/home/home_screen.dart';
import 'package:travel_app/ui/main_screen/main_screen.dart';
import 'package:travel_app/ui/onboard/onboard_1/world_is_wide_screen.dart';
import 'package:travel_app/ui/onboard/onboard_2/go_explore_screen.dart';
import 'package:travel_app/ui/onboard/onboard_3/trips_take_people_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travenor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: <String, Widget Function(BuildContext)>{
        '/': (context) {
          return const HelloScreen();
        },
        '/getStarted': (context) {
          return const WorldIsWideScreen();
        },
        '/getStarted/explore': (context) {
          return const GoExploreScreen();
        },
        '/getStarted/people': (context) {
          return const TripsTakePeopleScreen();
        },
        '/auth': (context) {
          return const SignInScreen();
        },
        '/auth/signup': (context) {
          return const SignUpScreen();
        },
        '/auth/forgotPassword': (context) {
          return const ForgotPasswordScreen();
        },
        '/auth/forgotPassword/verification': (context) {
          return ResetPasswordVerificationScreen();
        },
        '/home': (context) {
          return MainScreen();
        },
      },
      initialRoute: '/home',
    );
  }
}

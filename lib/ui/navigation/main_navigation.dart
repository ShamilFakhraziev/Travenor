import 'package:flutter/material.dart';
import 'package:travel_app/domain/services/auth_service.dart';
import 'package:travel_app/helpers/navigation/navigation_route_names.dart';
import 'package:travel_app/ui/auth/forgot_password_screen.dart';
import 'package:travel_app/ui/auth/reset_password_verification_screen.dart';
import 'package:travel_app/ui/auth/sign_in_screen.dart';
import 'package:travel_app/ui/auth/sign_up_screen.dart';
import 'package:travel_app/ui/get_started/hello_screen.dart';
import 'package:travel_app/ui/main_screen/main_screen.dart';
import 'package:travel_app/ui/onboard/onboard_1/world_is_wide_screen.dart';
import 'package:travel_app/ui/onboard/onboard_2/go_explore_screen.dart';
import 'package:travel_app/ui/onboard/onboard_3/trips_take_people_screen.dart';

// TODO: !Middle. Данный класс не должен находиться в ui папке
// abstract class MainNavigationRouteNames {
//   static const start = "/start";
//   static const getStarted = "/getStarted";
//   static const getStartedExplore = "/getStarted/explore";
//   static const getStartedPeople = "/getStarted/people";
//   static const auth = "/auth";
//   static const signup = "/auth/signup";
//   static const forgotPassword = "/auth/forgotPassword";
//   static const forgotPasswordVerification = "/auth/forgotPassword/verification";
//   static const home = "/home";
// }

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRouteNames.home : MainNavigationRouteNames.start;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.start: (context) {
      return const HelloScreen();
    },
    MainNavigationRouteNames.getStarted: (context) {
      return const WorldIsWideScreen();
    },
    MainNavigationRouteNames.getStartedExplore: (context) {
      return const GoExploreScreen();
    },
    MainNavigationRouteNames.getStartedPeople: (context) {
      return const TripsTakePeopleScreen();
    },
    MainNavigationRouteNames.auth: (context) {
      //TODO: Major. Не создаем обьекты сервисов, репозиториев и тд вручную, только DI
      final authService = AuthenticationService();
      // return BlocProvider<AuthenticationBloc>(
      //   lazy: false,
      //   create:
      //       (context) =>
      //           AuthenticationBloc(authService)..add(AuthenticationStarted()),
      //   child: const SignInScreen(),
      // );
      return const SignInScreen();
    },
    MainNavigationRouteNames.signup: (context) {
      return const SignUpScreen();
    },
    MainNavigationRouteNames.forgotPassword: (context) {
      return const ForgotPasswordScreen();
    },
    MainNavigationRouteNames.forgotPasswordVerification: (context) {
      return const ResetPasswordVerificationScreen();
    },
    MainNavigationRouteNames.home: (context) {
      return const MainScreen();
    },
  };
}

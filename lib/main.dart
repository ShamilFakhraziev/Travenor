import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/domain/blocs/global/auth/auth_bloc.dart';
import 'package:travel_app/domain/services/auth_service.dart';
import 'package:travel_app/domain/services/service_locator.dart'
    as service_locator;
import 'package:travel_app/ui/my_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  runApp(MultiBlocProvider(providers: globalBlocs, child: MyApp()));
}

final globalBlocs = [
  BlocProvider(create: (_) => AuthenticationBloc(AuthenticationService())),
];


//TODO: Модель достопримечательностей со сладером, запрос на галной 3 секунды, на деталке 2 (по красоте), json
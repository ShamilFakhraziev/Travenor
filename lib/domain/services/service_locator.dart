import 'package:get_it/get_it.dart';
import 'package:travel_app/domain/api/mock_destinations_api.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton(() => MockDestinationsApi());
}

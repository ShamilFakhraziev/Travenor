import 'package:travel_app/domain/api/mock_destinations_api.dart';
import 'package:travel_app/domain/entity/destination.dart';

class DestinationsRepository {
  late final MockDestinationsApi mockDestinationsApi;
  DestinationsRepository(this.mockDestinationsApi);

  Future<List<Destination>> getDestinations() async {
    try {
      //TODO: Middle. разобраться что такое диай и внедрить любой сущетсвующий пакет(например гетит) или написать самописный
      final destinations = await mockDestinationsApi.getDestinations();
      return destinations;
    } catch (_) {
      rethrow;
    }
  }
}

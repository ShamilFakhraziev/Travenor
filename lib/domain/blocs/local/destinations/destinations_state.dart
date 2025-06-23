import 'package:travel_app/domain/entity/destination.dart';

abstract class DestinationsState {}

class DestinationsLoading extends DestinationsState {}

class DestinationsSuccess extends DestinationsState {
  final List<Destination?> destinations;

  DestinationsSuccess({required this.destinations});
}

class DestinationsFailure extends DestinationsState {
  final String errorMessage;

  DestinationsFailure({required this.errorMessage});
}

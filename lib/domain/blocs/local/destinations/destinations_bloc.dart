import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_event.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_state.dart';
import 'package:travel_app/domain/repositories/destinations_repository.dart';

//TODO: Middle. каждый bloc в идеале должен лежать в своей папке внутри которой будет сам файл блока, файл стейтов, файл ивентов

//TODO: Major. Данный bloc интегрируется на экран home поэтому нужно отметить это в рамках файловой системы
class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsState> {
  final DestinationsRepository destinationsRepository;
  //TODO: Major. не надо урпавлять начальным состоянием блока из вне. Не вижу причин быть этому состоянию отличным от DestinationsLoading
  DestinationsBloc(this.destinationsRepository) : super(DestinationsLoading()) {
    on<DestinationsLoadingStart>(_onDestinationsLoadingStart);
  }

  Future<void> _onDestinationsLoadingStart(
    DestinationsEvent event,
    Emitter<DestinationsState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 3));
    try {
      final destinations = await destinationsRepository.getDestinations();
      emit(DestinationsSuccess(destinations: destinations));
    } catch (e) {
      emit(DestinationsFailure(errorMessage: e.toString()));
    }
  }
}

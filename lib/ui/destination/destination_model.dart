import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/destination.dart';

//TODO: где должна храниться модель
class DestinationModel extends InheritedWidget {
  const DestinationModel({
    super.key,
    required super.child,
    required this.destination,
  });

  final Destination destination;

  static DestinationModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DestinationModel>();
  }

  @override
  bool updateShouldNotify(DestinationModel oldWidget) {
    return true;
  }
}

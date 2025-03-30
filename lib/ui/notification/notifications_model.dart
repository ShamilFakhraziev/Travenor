import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/notification.dart';
import 'package:travel_app/helpers/images/app_image.dart';

enum NotificationTimeButtons { Recent, Earlier, Archieved }

class NotificationsModel extends ChangeNotifier {
  final List<UserNotification> _notifications = <UserNotification>[
    UserNotification(
      image: AppImage.profileImage,
      title: "Super Offer 1",
      body: "Get 60% off in our first booking",
      date: DateTime(2025, 3, 27),
    ),
    UserNotification(
      image: AppImage.profileImage,
      title: "Super Offer 2",
      body: "Get 60% off in our first booking",
      date: DateTime(2024, 11, 27),
    ),
    UserNotification(
      image: AppImage.profileImage,
      title: "Super Offer 3",
      body: "Get 60% off in our first booking",
      date: DateTime(2023, 11, 27),
    ),
  ];

  NotificationsModel() {
    setButton(NotificationTimeButtons.Recent);
  }
  List<UserNotification> get getNotifications => resultNotifications;
  List<UserNotification> resultNotifications = <UserNotification>[];
  NotificationTimeButtons? _button;
  NotificationTimeButtons? get getButton => _button;
  setButton(NotificationTimeButtons setButton) {
    _button = setButton;
    notifyListeners();
    if (_button == NotificationTimeButtons.Recent) {
      resultNotifications =
          _notifications
              .where((note) => DateTime.now().difference(note.date).inDays < 7)
              .toList();
    }
    if (_button == NotificationTimeButtons.Earlier) {
      resultNotifications =
          _notifications
              .where(
                (note) => DateTime.now().difference(note.date).inDays < 180,
              )
              .toList();
    }
    if (_button == NotificationTimeButtons.Archieved) {
      resultNotifications = _notifications;
    }
  }
}

class NotificationsModelProvider extends InheritedNotifier {
  final NotificationsModel model;
  const NotificationsModelProvider({
    super.key,
    required super.child,
    required this.model,
  }) : super(notifier: model);

  static NotificationsModel? watch<NotificationsModel>(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<NotificationsModelProvider>()
            ?.model
        as NotificationsModel?;
  }

  static NotificationsModel? read<NotificationsModel>(BuildContext context) {
    final widget =
        context
            .getElementForInheritedWidgetOfExactType<
              NotificationsModelProvider
            >()
            ?.widget;
    return widget is NotificationsModelProvider
        ? widget.model as NotificationsModel
        : null;
  }
}

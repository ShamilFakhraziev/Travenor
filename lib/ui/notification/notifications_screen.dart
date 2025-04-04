import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/notification.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/ui/notification/notifications_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 30),
          AppBarWidget(),
          SizedBox(height: 20),
          NotificationButtonsWidget(),
          NotificationsListWidget(),
        ],
      ),
    );
  }
}

class NotificationButtonsWidget extends StatelessWidget {
  const NotificationButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotificationsModelProvider.watch(context);
    if (model == null) return SizedBox.shrink();
    if (model.getButton == null)
      model.setButton(NotificationTimeButtons.Recent);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: Text(
              "Recent",
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    model.getButton == NotificationTimeButtons.Recent
                        ? AppColor.primaryColor
                        : Colors.grey,
              ),
            ),
            style: TextButton.styleFrom(),
            onPressed: () {
              model.setButton(NotificationTimeButtons.Recent);
            },
          ),
          TextButton(
            child: Text(
              "Earlier",
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    model.getButton == NotificationTimeButtons.Earlier
                        ? AppColor.primaryColor
                        : Colors.grey,
              ),
            ),
            onPressed: () {
              model.setButton(NotificationTimeButtons.Earlier);
            },
          ),
          TextButton(
            child: Text(
              "Archieved",
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:
                    model.getButton == NotificationTimeButtons.Archieved
                        ? AppColor.primaryColor
                        : Colors.grey,
              ),
            ),
            style: TextButton.styleFrom(),
            onPressed: () {
              model.setButton(NotificationTimeButtons.Archieved);
            },
          ),
        ],
      ),
    );
  }
}

class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotificationsModelProvider.watch<NotificationsModel>(context);
    final notifications = model?.getNotifications;
    if (model == null || notifications == null)
      return Center(
        child: Text(
          "No received notifications.",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'sf',
            color: Colors.grey,
          ),
        ),
      );
    return SizedBox(
      height: 550,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: NotificationItemWidget(
              userNotification: notifications[index],
            ),
          );
        },
      ),
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.userNotification});
  final UserNotification userNotification;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(158, 158, 158, 0.1),
      child: SizedBox(
        width: 375,
        height: 76,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  userNotification.image,
                  width: 48,
                  height: 48,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userNotification.title,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'sf',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      userNotification.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'sf',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  userNotification.date.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    fontFamily: 'sf',
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: IconButton(
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                backgroundColor: Color(0x101B1E28),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(Icons.arrow_back_ios, size: 24),
              ),
            ),
          ),
          Text(
            "Notifications",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'sf',
            ),
          ),
          TextButton(
            child: Text(
              "Clear all",
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.primaryColor,
              ),
            ),
            style: TextButton.styleFrom(),
            onPressed: () {
              //model?.not = NotificationTimeButtons.Recent;
            },
          ),
        ],
      ),
    );
  }
}

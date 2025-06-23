import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/domain/api/mock_destinations_api.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_bloc.dart';
import 'package:travel_app/domain/repositories/destinations_repository.dart';
import 'package:travel_app/domain/services/service_locator.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';
import 'package:travel_app/ui/my_profile/my_profile_screen.dart';
import 'package:travel_app/ui/destination/destinations_list_widget.dart';
import 'package:travel_app/ui/notification/notifications_screen.dart';
import 'package:travel_app/ui/notification/notifications_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO: !Minor. Быть внимательнее к содержимому скролов(должен ли ап бар уезжать)
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          AppBarWidget(),
          TitleWidget(),
          MainContentWidget(),
        ],
      ),
    );
  }
}

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainContentTitleWidget(),
          SizedBox(height: 10),
          BlocProvider(
            create:
                (context) => DestinationsBloc(
                  DestinationsRepository(
                    serviceLocator.get<MockDestinationsApi>(),
                  ),
                ),
            child: DestinationsListWidget(),
          ),
        ],
      ),
    );
  }
}

class MainContentTitleWidget extends StatelessWidget {
  const MainContentTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Best Destination",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'sf',
              fontSize: 20,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "View all",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400,
                fontFamily: 'sf',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore the",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'sf',
              fontSize: 38,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Beautiful ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'sf',
                  fontSize: 38,
                ),
              ),
              Column(
                children: [
                  Text(
                    "world!",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'sf',
                      fontSize: 38,
                      color: AppColor.mainWordColor,
                    ),
                  ),
                  Image.asset(AppImage.textUnderline, width: 120, height: 15),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              maximumSize: Size(120, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              backgroundColor: AppColor.backButtonColor,
            ),

            onPressed: () {
              //TODO: !Minor. Следить за единым стилем (если выбрал pushNamed значит использовать только его)
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const MyProfileScreen(),
                ),
              );
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImage.profileImage,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  "Leonardo",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'sf',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (BuildContext context) => NotificationsModelProvider(
                        model: NotificationsModel(),
                        child: NotificationsScreen(),
                      ),
                ),
              );
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}

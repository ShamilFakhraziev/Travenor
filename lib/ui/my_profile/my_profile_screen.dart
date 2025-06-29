import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';
import 'package:travel_app/ui/my_profile/edit_profile_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(),
            ProfileImage(),
            SizedBox(height: 8),
            ProfileUserName(),
            SizedBox(height: 25),
            ProfileAchievements(),
            SizedBox(height: 25),
            Align(alignment: Alignment.centerLeft, child: ProfileSettings()),
          ],
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //TODO: !Middle. Когда один и тот же item повторяется несколько раз задайся вопросом можно ли переделать через List.builder
          SettingsItem(icon: Icons.person_outline, name: "Profile"),
          SettingsItem(icon: Icons.bookmark_outline, name: "Bookmarked"),
          SettingsItem(icon: Icons.history, name: "Previous Trip"),
          SettingsItem(icon: Icons.settings_outlined, name: "Settings"),
          SettingsItem(icon: Icons.public_rounded, name: "Version"),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.icon, required this.name});
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      //TODO: !Middle. Когда у тебя sizedBox внутри ColoredBox или наоборот можно просто заменить на контэйнер
      child: Container(
        height: 40,
        color: const Color.fromRGBO(158, 158, 158, 0.04),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(iconColor: Colors.grey),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(icon, size: 28),
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'sf',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAchievements extends StatelessWidget {
  const ProfileAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      //TODO: !Minor. Можно было вынести в AppColors
      color: AppColor.profileAchievmentsBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 350,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AchievementItem(title: "Reward Points", value: 360),
              Container(
                width: 1,
                height: 78,
                color: const Color.fromRGBO(158, 158, 158, 0.4),
              ),
              AchievementItem(title: "Travel Trips", value: 238),
              Container(
                width: 1,
                height: 78,
                color: const Color.fromRGBO(158, 158, 158, 0.4),
              ),
              AchievementItem(title: "Bucket List", value: 473),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementItem extends StatelessWidget {
  const AchievementItem({super.key, required this.title, required this.value});
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'sf',
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryColor,
            fontSize: 16,
            fontFamily: 'sf',
          ),
        ),
      ],
    );
  }
}

class ProfileUserName extends StatelessWidget {
  const ProfileUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Leonardo",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'sf',
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Leonardo@gmail.com",
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'sf',
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(48),
      child: Image.asset(AppImage.profileImage, width: 96, height: 96),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
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
                Navigator.of(context).pushNamed('/home');
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(Icons.arrow_back_ios, size: 24),
              ),
            ),
          ),
          Text(
            "Profile",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'sf',
            ),
          ),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (BuildContext context) => const EditProfileScreen(),
                  ),
                );
              },
              icon: Icon(Icons.edit, size: 28, color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

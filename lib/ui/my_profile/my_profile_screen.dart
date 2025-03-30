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
            _AppBarWidget(),
            _ProfileImage(),
            SizedBox(height: 8),
            _ProfileUserName(),
            SizedBox(height: 25),
            _ProfileAchievements(),
            SizedBox(height: 25),
            Align(alignment: Alignment.centerLeft, child: _ProfileSettings()),
          ],
        ),
      ),
    );
  }
}

class _ProfileSettings extends StatelessWidget {
  const _ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _SettingsItem(icon: Icons.person_outline, name: "Profile"),
          _SettingsItem(icon: Icons.bookmark_outline, name: "Bookmarked"),
          _SettingsItem(icon: Icons.history, name: "Previous Trip"),
          _SettingsItem(icon: Icons.settings_outlined, name: "Settings"),
          _SettingsItem(icon: Icons.public_rounded, name: "Version"),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({super.key, required this.icon, required this.name});
  final IconData icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
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
      ),
    );
  }
}

class _ProfileAchievements extends StatelessWidget {
  const _ProfileAchievements({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(158, 158, 158, 0.04),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 350,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _AchievementItem(title: "Reward Points", value: 360),
              Container(
                width: 1,
                height: 78,
                color: const Color.fromRGBO(158, 158, 158, 0.4),
              ),
              _AchievementItem(title: "Travel Trips", value: 238),
              Container(
                width: 1,
                height: 78,
                color: const Color.fromRGBO(158, 158, 158, 0.4),
              ),
              _AchievementItem(title: "Bucket List", value: 473),
            ],
          ),
        ),
      ),
    );
  }
}

class _AchievementItem extends StatelessWidget {
  const _AchievementItem({super.key, required this.title, required this.value});
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

class _ProfileUserName extends StatelessWidget {
  const _ProfileUserName({super.key});

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

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(48),
      child: Image.asset(AppImage.profileImage, width: 96, height: 96),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({super.key});

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

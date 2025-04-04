import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarWidget(),
              ProfileImage(),
              SizedBox(height: 8),
              ProfileUserName(),
              SizedBox(height: 25),
              FirstNameWidget(),
              SizedBox(height: 15),
              LastNameWidget(),
              SizedBox(height: 15),
              LocationWidget(),
              SizedBox(height: 15),
              MobileNumberWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileNumberWidget extends StatelessWidget {
  const MobileNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mobile Number",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'sf',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixText: '+7 ',
              suffixIcon: Icon(Icons.check, color: AppColor.primaryColor),
              filled: true,
              fillColor: AppColor.backButtonColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'sf',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.check, color: AppColor.primaryColor),
              filled: true,
              fillColor: AppColor.backButtonColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class LastNameWidget extends StatelessWidget {
  const LastNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'sf',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.check, color: AppColor.primaryColor),
              filled: true,
              fillColor: AppColor.backButtonColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class FirstNameWidget extends StatelessWidget {
  const FirstNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'sf',
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 48,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.check, color: AppColor.primaryColor),
              filled: true,
              fillColor: AppColor.backButtonColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey, width: 0),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
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
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
          ),
          child: Text(
            "Change Profile Picture",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontFamily: 'sf',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
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
                Navigator.of(context).pop();
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(Icons.arrow_back_ios, size: 24),
              ),
            ),
          ),
          Text(
            "Edit Profile",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'sf',
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Done",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontFamily: 'sf',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

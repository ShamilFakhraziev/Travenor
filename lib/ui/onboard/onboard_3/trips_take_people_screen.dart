import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';
import 'package:travel_app/ui/onboard/select_bar_widget.dart';

class TripsTakePeopleScreen extends StatelessWidget {
  const TripsTakePeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          _ImageWidget(),
          SizedBox(height: 30),
          _TitleWidget(),
          SizedBox(height: 10),
          _DescriptionWidget(),
          SizedBox(height: 20),
          SelectBarWidget(selectedPageNumber: 3, pagesCount: 3),
          SizedBox(height: 30),
          _NextButtonWidget(),
        ],
      ),
    );
  }
}

class _NextButtonWidget extends StatelessWidget {
  const _NextButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/auth");
        },
        child: Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Geometry",
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "People don`t take trips,",

          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 30,
            fontFamily: "Geometr",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "trips take ",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 30,
                fontFamily: "Geometr",
              ),
            ),
            Column(
              children: [
                Text(
                  "people",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xffFF7029),
                    fontSize: 30,
                    fontFamily: "Geometr",
                  ),
                ),
                Image.asset(AppImage.textUnderline, width: 63, height: 10),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      height: 72,
      child: Text(
        "Let new places reveal your essence, discover what you`ve been searching for. We`ll guide you on this incredible adventure!",
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Color(0xff7D848D),
          fontSize: 16,
          fontFamily: "Gill Sans",
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({super.key});

  final double _radiusOfBorder = 30;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(_radiusOfBorder),
            bottomRight: Radius.circular(_radiusOfBorder),
          ),
          child: Image.asset(
            AppImage.tripsTakePeopleImage,
            height: (MediaQuery.of(context).size.height / 2) + 30,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 30,
          right: 15,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/auth");
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: AppColor.skipButtonColor,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                fontFamily: "Gill Sans",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

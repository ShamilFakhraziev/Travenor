import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';
import 'package:travel_app/ui/onboard/select_bar_widget.dart';

class WorldIsWideScreen extends StatelessWidget {
  const WorldIsWideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          ImageWidget(),
          SizedBox(height: 30),
          TitleWidget(),
          SizedBox(height: 10),
          DescriptionWidget(),
          SizedBox(height: 20),
          SelectBarWidget(selectedPageNumber: 1, pagesCount: 3),
          SizedBox(height: 30),
          GetStartedButtonWidget(),
        ],
      ),
    );
  }
}

class GetStartedButtonWidget extends StatelessWidget {
  const GetStartedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/getStarted/explore");
        },
        child: Text(
          "Get Started",
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

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Life is short and the",

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
              "world is ",
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
                  "wide",
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

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 303,
      height: 72,
      child: Text(
        "At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world",
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

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

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
            AppImage.worldIsWideImage,
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

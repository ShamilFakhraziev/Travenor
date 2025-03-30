import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xff0D6EFD),
      child: Stack(
        children: [
          Center(
            child: const Text(
              "Travenor",

              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
                fontFamily: "Geometr",
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 15,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/getStarted");
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
      ),
    );
  }
}

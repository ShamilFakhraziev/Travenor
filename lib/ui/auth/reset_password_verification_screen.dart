import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class ResetPasswordVerificationScreen extends StatelessWidget {
  const ResetPasswordVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          alignment: Alignment.center,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
      ),
      body: Center(
        child: ColoredBox(
          color: Colors.white,
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  const TitleWidget(),
                  SizedBox(height: 40),
                  VerifyFormWidget(),
                  SizedBox(height: 16),
                  ResentCodeWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResentCodeWidget extends StatefulWidget {
  const ResentCodeWidget({super.key});

  @override
  State<ResentCodeWidget> createState() => _ResentCodeWidgetState();
}

class _ResentCodeWidgetState extends State<ResentCodeWidget> {
  bool _isButtonEnabled = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(minutes: 2), (timer) {
      setState(() {
        _isButtonEnabled = true;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Resend code to",
              style: TextStyle(
                fontFamily: 'sf',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.descriptionTextColor,
              ),
            ),
          ),
          TextButton(
            onPressed: _isButtonEnabled ? () {} : null,
            child: Text(
              "Resend code",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontFamily: 'sf',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyFormWidget extends StatefulWidget {
  const VerifyFormWidget({super.key});

  @override
  State<VerifyFormWidget> createState() => _VerifyFormWidgetState();
}

class _VerifyFormWidgetState extends State<VerifyFormWidget> {
  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: VerifyFormTitle()),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerifyCodeItemWidget(),
            SizedBox(width: 20),
            VerifyCodeItemWidget(),
            SizedBox(width: 20),
            VerifyCodeItemWidget(),
            SizedBox(width: 20),
            VerifyCodeItemWidget(),
          ],
        ),
        SizedBox(height: 30),
        VerifyButtonWidget(),
      ],
    );
  }
}

class VerifyFormTitle extends StatelessWidget {
  const VerifyFormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "OTP Code",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "sf",
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

class VerifyCodeItemWidget extends StatelessWidget {
  const VerifyCodeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 70,
      child: TextField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        focusNode: FocusNode(),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.backButtonColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontFamily: "sf",
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class VerifyButtonWidget extends StatelessWidget {
  const VerifyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/home");
        },
        child: Text(
          "Verify",
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
      children: [
        Text(
          "OTP Verification",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "sf",
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          width: 257,
          height: 50,
          child: Text(
            maxLines: 2,
            "Please check your email www.uihut@gmail.com to see the verification code",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColor.descriptionTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

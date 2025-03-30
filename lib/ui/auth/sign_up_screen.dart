import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  const _TitleWidget(),
                  SizedBox(height: 40),
                  _RegistrationForm(),
                  SizedBox(height: 30),
                  _RedirectToSignInWidget(),
                  Text(
                    "Or connect",
                    style: TextStyle(
                      fontFamily: "sf",
                      fontSize: 14,
                      color: AppColor.descriptionTextColor,
                    ),
                  ),
                  SizedBox(height: 20),
                  _FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 172,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Image.asset(AppImage.facebook)),
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(AppImage.instagram, width: 40, height: 40),
            ),
          ),
          IconButton(onPressed: () {}, icon: Image.asset(AppImage.twitter)),
        ],
      ),
    );
  }
}

class _RedirectToSignInWidget extends StatelessWidget {
  const _RedirectToSignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account",
          style: TextStyle(
            fontFamily: "sf",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColor.descriptionTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/auth");
          },
          child: Text(
            "Sign in",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontFamily: 'sf',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _RegistrationForm extends StatefulWidget {
  const _RegistrationForm({super.key});

  @override
  State<_RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<_RegistrationForm> {
  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: 350,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.backButtonColor,
              labelText: "Username",
              labelStyle: TextStyle(
                fontFamily: "sf",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.descriptionTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
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
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 56,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.backButtonColor,
              labelText: "Email",
              labelStyle: TextStyle(
                fontFamily: "sf",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.descriptionTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
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
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 80,
          width: 350,
          child: TextField(
            obscureText: isObscuredPassword,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              helperText: "Password must be 8 character",
              helperStyle: TextStyle(
                fontFamily: "sf",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColor.descriptionTextColor,
              ),
              filled: true,
              fillColor: AppColor.backButtonColor,
              suffixIcon: IconButton(
                onPressed: () {
                  isObscuredPassword = !isObscuredPassword;
                  setState(() {});
                },
                icon: Icon(
                  isObscuredPassword == false
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
              labelText: "Password",
              labelStyle: TextStyle(
                fontFamily: "sf",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.descriptionTextColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
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
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(height: 30),
        _SignUpButtonWidget(),
      ],
    );
  }
}

class _SignUpButtonWidget extends StatelessWidget {
  const _SignUpButtonWidget({super.key});

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
          "Sign Up",
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
      children: [
        Text(
          "Sign up now",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "sf",
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Please fill the details and create account",
          style: TextStyle(
            fontFamily: "sf",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColor.descriptionTextColor,
          ),
        ),
      ],
    );
  }
}

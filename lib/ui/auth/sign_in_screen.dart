import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          alignment: Alignment.center,
          // TODO:Minor.Когда в onPressed, онтап и тд единственный метод без аргументов - можем убрать скобки у метода и конструкцию () =>
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back_ios),
          style: IconButton.styleFrom(
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
                  AuthForm(),
                  SizedBox(height: 30),
                  RedirectToSignUpWidget(),
                  Text(
                    "Or connect",
                    style: TextStyle(
                      fontFamily: "sf",
                      fontSize: 14,
                      color: AppColor.descriptionTextColor,
                    ),
                  ),
                  SizedBox(height: 40),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

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

class RedirectToSignUpWidget extends StatelessWidget {
  const RedirectToSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don`t have an account?",
          style: TextStyle(
            fontFamily: "sf",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColor.descriptionTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/auth/signup");
          },
          child: Text(
            "Sign up",
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

class AuthForm extends StatefulWidget {
  const AuthForm();

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: 350,
          // TODO: Middle.Мог вынести в отдельный виджет AppTextField
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.backButtonColor,
              labelText: "Email",
              labelStyle: TextStyle(),
              // TODO: Minor.Мог вынести в отдельную переменную transparentBorder
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
        SizedBox(height: 24),
        SizedBox(
          height: 56,
          width: 350,
          child: TextField(
            obscureText: isObscuredPassword,
            obscuringCharacter: '*',

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.backButtonColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscuredPassword = !isObscuredPassword;
                  });
                },

                icon: Icon(
                  // TODO: Major.Какоу нахуй == false. Когда у тебя блуева переменная то она по дефолту равна true, а !она равна false
                  isObscuredPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              labelText: "Password",
              labelStyle: TextStyle(),
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
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/auth/forgotPassword");
              },
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontFamily: 'sf',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        SignInButtonWidget(),
      ],
    );
  }
}

class SignInButtonWidget extends StatelessWidget {
  const SignInButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/home");
        },
        child: Text(
          "Sign In",
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
          "Sign in now",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "sf",
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Please sign in to continue our app",
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

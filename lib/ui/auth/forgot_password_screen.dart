import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                  ForgotPasswordFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordFormWidget extends StatefulWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  State<ForgotPasswordFormWidget> createState() =>
      _ForgotPasswordFormWidgetState();
}

class _ForgotPasswordFormWidgetState extends State<ForgotPasswordFormWidget> {
  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: 350,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.backButtonColor,
              labelText: "Email",
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
        SizedBox(height: 30),
        ResetPasswordButtonWidget(),
      ],
    );
  }
}

class ResetPasswordButtonWidget extends StatelessWidget {
  const ResetPasswordButtonWidget({super.key});

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          true, // Пользователь не сможет закрыть окно, нажав вне его
      builder: (BuildContext context) {
        return SizedBox(
          width: 335,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AlertDialog(
              // Заголовок окна
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.email_rounded),
                  Text(
                    "Check your email",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "sf",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 257,
                    height: 60,
                    child: Text(
                      maxLines: 2,
                      "We have send password recovery instruction to your email",
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
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'), // Кнопка закрытия
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      "/auth/forgotPassword/verification",
                    ); // Закрываем окно
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Text(
          "Reset Password",
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
          "Forgot password",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "sf",
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          width: 260,
          height: 50,
          child: Text(
            maxLines: 2,
            "Enter your email account to reset  your password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "sf",
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColor.descriptionTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

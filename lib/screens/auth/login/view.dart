import 'package:flutter/material.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import '../../../styles/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5),
            child: Column(children: [
              const Image(
                image: AssetImage('assets/images/app_logo.png'),
                width: 120,
                height: 150,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 20),
                  child: Text(
                    'مرحبا بك مره اخري ',
                    style: authGreenTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'يمكنك تسجيل الدخول الان',
                    style: authGreyTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                name: "رقم الجوال",
                image: "assets/icons/auth/phone.png",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                name: "كلمه المرور",
                image: "assets/icons/auth/password.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      ' نسيت كلمه المرور ؟',
                      style: authGreyTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AuthButton(buttonName: 'تسجيل الدخول'),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                      text: 'ليس لديك حساب ؟',
                      style: authGreenTextStyle.copyWith(fontSize: 15),
                      children: [
                    TextSpan(
                        text: 'تسجيل الان',
                        style: authGreenTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15))
                  ])),
            ]),
          ),
        ),
      ),
    );
  }
}

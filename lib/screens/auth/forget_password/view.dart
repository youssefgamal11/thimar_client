import 'package:flutter/material.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import '../../../styles/styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(right: 6.0, top: 20),
                  child: Text(
                    'نسيت كلمه المرور',
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
                    'ادخل رقم الجوال المرتبط بحسابك',
                    style: authGreyTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextFormField(
                name: " رقم الجوال",
                image: "assets/icons/auth/phone.png",
              ),
              const SizedBox(
                height: 30,
              ),
              const AuthButton(buttonName: 'تأكيد رقم الجوال'),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                      text: 'ليس لديك حساب ؟',
                      style: authGreenTextStyle.copyWith(fontSize: 15),
                      children: [
                    TextSpan(
                        text: 'تسجيل الدخول',
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

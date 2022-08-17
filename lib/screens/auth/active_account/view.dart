import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import '../../../styles/color.dart';
import '../../../styles/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ActivateAccountScreen extends StatefulWidget {
  const ActivateAccountScreen({Key? key}) : super(key: key);

  @override
  State<ActivateAccountScreen> createState() => _ActivateAccountScreenState();
}

class _ActivateAccountScreenState extends State<ActivateAccountScreen> {
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
                    'تفعيل الحساب',
                    style: authGreenTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                      text: ' الكود المكون من 4 ارقام المرسل على رقم الجوال ',
                      style: authGreyTextStyle.copyWith(fontSize: 15),
                      children: [
                        TextSpan(
                            text: '  46465464',
                            style: authGreyTextStyle.copyWith(fontSize: 15)),
                        TextSpan(
                            text: '  تغير رقم الجوال',
                            style: authGreenTextStyle.copyWith(
                                fontSize: 15,
                                decoration: TextDecoration.underline))
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  enableActiveFill: true,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                      fieldWidth: 67,
                      fieldHeight: 55,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      errorBorderColor: Colors.red,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade200),
                  onChanged: (String value) {},
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AuthButton(buttonName: 'تأكيد الكود '),
              const SizedBox(height: 15),
              Text(
                "لم تستلم الكود ؟",
                style: authGreyTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'يمكنك اعاده ارسال الكود بعد ',
                style: authGreyTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              CircularCountDownTimer(
                duration: 1200,
                initialDuration: 0,
                controller: CountDownController(),
                width: 90,
                height: 80,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: greenFontColor,
                fillGradient: null,
                backgroundColor: Colors.white,
                backgroundGradient: null,
                strokeWidth: 3.0,
                strokeCap: StrokeCap.round,
                textStyle: authGreenTextStyle.copyWith(
                    fontSize: 30, fontWeight: FontWeight.w400),
                textFormat: CountdownTextFormat.MM_SS,
                isReverse: false,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  debugPrint('Countdown Started');
                },
                onComplete: () {
                  debugPrint('Countdown Ended');
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const ResendButton(ButtonName: 'اعاده الارسال '),
              const SizedBox(
                height: 40,
              ),
              RichText(
                  text: TextSpan(
                      text: ' لديك حساب بالفعل ؟',
                      style: authGreenTextStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w400),
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

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/screens/auth/login/view.dart';
import 'package:thimar_app/screens/auth/verify/bloc/bloc.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/styles.dart';
import '../../../core/toast.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final bloc = KiwiContainer().resolve<VerifyBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.w),
            child: Column(children: [
              Image(
                image: AssetImage(Assets.images.appLogo.path),
                width: 120.w,
                height: 150.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 10.0.w, top: 20.h, start: 10.h),
                  child: Text(
                    LocaleKeys.activeAccount.tr(),
                    style: authGreenTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: RichText(
                  text: TextSpan(
                      text: LocaleKeys.enterOTPCode.tr(),
                      style: authGreyTextStyle.copyWith(fontSize: 15.sp),
                      children: [
                        TextSpan(
                            text: widget.phoneNumber,
                            style: authGreyTextStyle.copyWith(fontSize: 15.sp)),
                        TextSpan(
                            text: LocaleKeys.changePhoneNumber.tr(),
                            style: authGreenTextStyle.copyWith(
                                fontSize: 15.sp,
                                decoration: TextDecoration.underline))
                      ]),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  enableActiveFill: true,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                      fieldWidth: 67.w,
                      fieldHeight: 55.h,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8.r),
                      errorBorderColor: Colors.red,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade200),
                  onCompleted: (value) {
                    bloc.codeNumber = value;
                  },
                  onChanged: (String value) {},
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is VerifySuccessState) {
                      Toast.show(LocaleKeys.confirmCodeSuccess.tr(), context);
                      navigateTo(
                          leaveHistory: false, page: const LoginScreen());
                    } else if (state is VerifyFailState) {
                      Toast.show(state.error!, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return AuthButton(
                      buttonName: LocaleKeys.confirmCode.tr(),
                      function: () {
                        if (bloc.codeNumber != null) {
                          bloc.add(VerifyEventStart(phone: widget.phoneNumber));
                        } else {
                          Toast.show(LocaleKeys.writeYourData.tr(), context);
                        }
                      },
                    );
                  }),
              SizedBox(height: 15.h),
              Text(
                LocaleKeys.notHaveCode.tr(),
                style: authGreyTextStyle,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                LocaleKeys.youCanSendCodeAgainAfter.tr(),
                style: authGreyTextStyle,
              ),
              SizedBox(
                height: 10.h,
              ),
              CircularCountDownTimer(
                duration: 120,
                initialDuration: 0,
                controller: CountDownController(),
                width: 90.w,
                height: 80.h,
                ringColor: Colors.grey[300]!,
                ringGradient: null,
                fillColor: greenFontColor,
                fillGradient: null,
                backgroundColor: Colors.white,
                backgroundGradient: null,
                strokeWidth: 3.0,
                strokeCap: StrokeCap.round,
                textStyle: authGreenTextStyle.copyWith(
                    fontSize: 30.sp, fontWeight: FontWeight.w400),
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
                  setState(() {
                    bloc.isComplete = true;
                  });
                },
                onChange: (String timeStamp) {
                  debugPrint('Countdown Changed $timeStamp');
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocConsumer(
                bloc: bloc,
                listener: (context, state) {},
                builder: (context, state) {
                  if (bloc.isComplete) {
                    return ResendButton(
                        buttonName: LocaleKeys.resend.tr(),
                        function: bloc.isComplete
                            ? () {
                                bloc.add(ResendCodeEventStart(
                                    phone: widget.phoneNumber));
                              }
                            : () {
                                return;
                              });
                  } else {
                    return const Text('');
                  }
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              RichText(
                  text: TextSpan(
                      text: LocaleKeys.haveAccount.tr(),
                      style: authGreenTextStyle.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => navigateTo(
                              leaveHistory: false, page: const LoginScreen()),
                        text: LocaleKeys.login.tr(),
                        style: authGreenTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15.sp))
                  ])),
            ]),
          ),
        ),
      ),
    );
  }
}

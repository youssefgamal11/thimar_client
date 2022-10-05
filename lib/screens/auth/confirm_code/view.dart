import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/toast.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/screens/auth/change_password/view.dart';
import 'package:thimar_app/screens/auth/confirm_code/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/login/view.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/styles.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final bloc = KiwiContainer().resolve<ConfirmCodeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Image(
                  image: AssetImage(Assets.images.appLogo.path),
                  width: 120.w,
                  height: 150.h,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 10.0.w, top: 20.h, bottom: 7.h),
                child: Text(
                  LocaleKeys.forgetPasswordWithout.tr(),
                  style: authGreenTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: RichText(
                  text: TextSpan(
                      text: LocaleKeys.enterOTPCode.tr(),
                      style: authGreyTextStyle.copyWith(fontSize: 15.sp),
                      children: [
                        TextSpan(
                            text: widget.phone,
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
                padding: EdgeInsetsDirectional.only(start: 8.0.w, end: 8.w),
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
                  onChanged: (String value) {},
                  onCompleted: (value) {
                    bloc.codeNumber = value;
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is ConfirmCodeSucessState) {
                      Toast.show(LocaleKeys.confirmCodeSuccess.tr(), context);
                      navigateTo(
                          leaveHistory: false,
                          page: ChangePasswordScreen(
                            code: bloc.codeNumber.toString(),
                            phone: bloc.phoneNumber.toString(),
                          ));
                    } else if (state is ConfirmCodeFailState) {
                      Toast.show(state.error!, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is ConfirmCodeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return AuthButton(
                      buttonName: LocaleKeys.confirmCode.tr(),
                      function: () {
                        if (bloc.codeNumber != null) {
                          bloc.add(ConfirmCodeStartEvent(phone: widget.phone));
                        } else {
                          Toast.show(LocaleKeys.writeYourData.tr(), context);
                        }
                      },
                    );
                  }),
              SizedBox(height: 15.h),
              Center(
                child: Text(
                  LocaleKeys.notHaveCode.tr(),
                  style: authGreyTextStyle,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Center(
                child: Text(
                  LocaleKeys.youCanSendCodeAgainAfter.tr(),
                  style: authGreyTextStyle,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: CircularCountDownTimer(
                  duration: 60,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: 80.w,
                  height: 80.h,
                  ringColor: Colors.grey[300]!,
                  ringGradient: null,
                  fillColor: greenFontColor,
                  fillGradient: null,
                  backgroundColor: Colors.white,
                  backgroundGradient: null,
                  strokeWidth: 3.0.w,
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
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ResendCodeLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is ResendCodeFailState) {
                      return Text(state.error.toString());
                    }

                    if (bloc.isComplete) {
                      return ResendButton(
                          buttonName: LocaleKeys.resend.tr(),
                          function: bloc.isComplete
                              ? () {
                                  bloc.add(ResendCodeStartEvent(
                                      phone: widget.phone));
                                }
                              : () {
                                  return;
                                });
                    } else {
                      return const Text('');
                    }
                  },
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: RichText(
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

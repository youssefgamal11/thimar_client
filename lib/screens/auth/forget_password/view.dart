import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/auth/confirm_code/view.dart';
import 'package:thimar_app/screens/auth/forget_password/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/login/view.dart';

import '../../../core/styles/styles.dart';
import '../../../core/toast.dart';
import '../../../gen/assets.gen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<ForgetPasswordBloc>();

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
                    end: 15.0.w, top: 20.h, start: 10.h),
                child: Text(
                  LocaleKeys.forgetPasswordWithout.tr(),
                  style: authGreenTextStyle,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    end: 15.0.w, bottom: 20.h, start: 10.h),
                child: Text(
                  LocaleKeys.enterConnectedPhone.tr(),
                  style: authGreyTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 8.0.w),
                child: CustomTextFormField(
                  controller: bloc.phoneNumber,
                  name: LocaleKeys.phoneNumber.tr(),
                  keyboardType: TextInputType.number,
                  image: Assets.icons.auth.phone.path,
                  isSecure: false,
                  pinCodeWidgetExist: true,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccessState) {
                      navigateTo(
                          leaveHistory: false,
                          page: ConfirmCodeScreen(
                            phone: bloc.phoneNumber.text,
                          ));
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgetPasswordLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return AuthButton(
                        buttonName: LocaleKeys.confirmPhoneNumber.tr(),
                        function: () {
                          bloc.unfocus(context: context);
                          if (bloc.phoneNumber.text.trim().isNotEmpty) {
                            bloc.add(ForgetPasswordStartEvent());
                          } else {
                            Toast.show(
                                LocaleKeys.PleaseWriteYourPhoneNumber.tr(),
                                context);
                          }
                        },
                      );
                    }
                  }),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: LocaleKeys.haveAccount.tr(),
                        style: authGreenTextStyle.copyWith(fontSize: 15.sp),
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

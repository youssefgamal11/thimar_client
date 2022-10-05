import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/toast.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/screens/auth/change_password/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/login/view.dart';
import '../../../core/styles/styles.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen(
      {Key? key, required this.code, required this.phone})
      : super(key: key);
  final String phone, code;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final bloc = KiwiContainer().resolve<ChangePasswordBloc>();

  @override
  void dispose() {
    bloc.clearFields();
    super.dispose();
  }

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
                child: Image.asset(
                  Assets.images.appLogo.path,
                  width: 120.w,
                  height: 150.h,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    end: 15.0.w, top: 20.h, start: 15.h),
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
                    end: 15.0.w, bottom: 20.h, start: 15.w),
                child: Text(
                  LocaleKeys.enterNewPassword.tr(),
                  style: authGreyTextStyle,
                ),
              ),
              CustomTextFormField(
                name: LocaleKeys.password.tr(),
                image: Assets.icons.auth.password.path,
                controller: bloc.passwordController,
                isPassword: true,
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                name: LocaleKeys.confirmPassword.tr(),
                image: Assets.icons.auth.password.path,
                controller: bloc.confirmPasswordController,
                isPassword: true,
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is ChangePasswordSucessState) {
                      Toast.show(LocaleKeys.changePasswordSucced.tr(), context);
                      navigateTo(
                          leaveHistory: false, page: const LoginScreen());
                    } else if (state is ChangePasswordFailState) {
                      Toast.show(LocaleKeys.changePasswordFailed.tr(), context);
                    }
                  },
                  builder: (context, state) {
                    if (state is ChangePasswordLoadingState) {
                      return const CircularProgressIndicator();
                    } else {
                      return AuthButton(
                          buttonName: LocaleKeys.changePassword.tr(),
                          function: () {
                            bloc.unfocus(context);
                            if (bloc.isDataVaild(context)) {
                              bloc.add(ChangePasswordStartState(
                                  code: widget.code, phone: widget.phone));
                            }
                          });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: LocaleKeys.noAccount.tr(),
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

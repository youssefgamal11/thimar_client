import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/screens/auth/forget_password/view.dart';
import 'package:thimar_app/screens/auth/login/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/signup/view.dart';
import 'package:thimar_app/screens/home/view.dart';
import '../../../core/styles/styles.dart';
import '../../../core/toast.dart';
import '../../../generated/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = KiwiContainer().resolve<LoginBloc>()..init();
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
                child: Image(
                  image: AssetImage(Assets.images.appLogo.path),
                  width: 120.w,
                  height: 150.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    end: 15.0.w, start: 15.w, bottom: 7.h),
                child: Text(
                  LocaleKeys.helloAgain.tr(),
                  style: authGreenTextStyle,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 15.w),
                child: Text(
                  LocaleKeys.loginNow.tr(),
                  style: authGreyTextStyle,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w, bottom: 10.h),
                child: CustomTextFormField(
                  name: LocaleKeys.phone.tr(),
                  image: Assets.icons.auth.phone.path,
                  controller: bloc.phoneController,
                  keyboardType: TextInputType.phone,
                  isSecure: false,
                  pinCodeWidgetExist: true,
                ),
              ),
              CustomTextFormField(
                name: LocaleKeys.password.tr(),
                image: Assets.icons.auth.password.path,
                controller: bloc.passwordController,
                isPassword: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(
                          leaveHistory: true, page: ForgetPasswordScreen());
                      bloc.clearFields();
                    },
                    child: Text(
                      LocaleKeys.forgetPassword.tr(),
                      style: authGreyTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) async {
                    if (state is LoginSucessState) {
                      Toast.show(LocaleKeys.loginSuccess.tr(), context);
                      navigateTo(leaveHistory: false, page: const Homepage());
                      bloc.clearFields();
                    } else if (state is LoginFailState) {
                      Toast.show(LocaleKeys.loginFailed.tr(), context);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return AuthButton(
                      buttonName: LocaleKeys.login.tr(),
                      function: () {
                        // bloc.add(LoginEventStart());
                        bloc.unfocus(context);
                        if (bloc.isDataVaild(context)) {
                          bloc.add(LoginEventStart());
                        }
                      },
                    );
                  }),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: RichText(
                    text: TextSpan(
                        text: LocaleKeys.noAccount.tr(),
                        style: authGreenTextStyle.copyWith(fontSize: 15.sp),
                        children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigateTo(
                                  leaveHistory: true, page: SignUpScreen());
                              bloc.clearFields();
                            },
                          text: LocaleKeys.registerNow.tr(),
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

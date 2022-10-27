import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/dialogs/choose_city.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/models/city_model.dart';
import 'package:thimar_app/screens/auth/login/view.dart';
import 'package:thimar_app/screens/auth/signup/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/verify/view.dart';
import '../../../core/styles/styles.dart';
import '../../../core/toast.dart';
import '../../../gen/assets.gen.dart';
import '/../generated/locale_keys.g.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<SignupBloc>();

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
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    LocaleKeys.youCanRegisterNow.tr(),
                    style: authGreyTextStyle,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: bloc.nameController,
                name: LocaleKeys.userName.tr(),
                image: Assets.icons.auth.user.path,
                isSecure: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.0.w),
                child: CustomTextFormField(
                  controller: bloc.phoneController,
                  name: LocaleKeys.phoneNumber.tr(),
                  image: Assets.icons.auth.phone.path,
                  keyboardType: TextInputType.phone,
                  isSecure: false,
                  pinCodeWidgetExist: true,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        image: Assets.icons.auth.city.path,
                        name: bloc.cityName ?? LocaleKeys.city.tr(),
                        isCitySelection: true,
                        onWidgetPressed: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(15.r),
                                    topStart: Radius.circular(15.r)),
                              ),
                              builder: (context) => ChooseCityDialog(
                                    selectedCityId: bloc.cityId ?? "-1",
                                  )).then((value) {
                            if (value != null) {
                              var city = value as City;
                              bloc.cityId = city.id;
                              bloc.cityName = city.name;
                              setState(() {});
                            }
                          });
                        },
                        isEnabled: false,
                      ),
                    ),
                    (bloc.cityName != null ||
                            bloc.cityName == LocaleKeys.city.tr())
                        ? Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                bloc.cityName = null;
                                bloc.cityId = null;
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                controller: bloc.passwordController,
                name: LocaleKeys.password.tr(),
                image: Assets.icons.auth.password.path,
                isPassword: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                controller: bloc.confirmPasswordController,
                name: LocaleKeys.password.tr(),
                image: Assets.icons.auth.password.path,
                isPassword: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is SignUpSucessState) {
                      navigateTo(
                          leaveHistory: false,
                          page: VerifyAccountScreen(
                            phoneNumber: bloc.phoneController.text,
                          ));
                    } else if (state is SignUpFailState) {
                      Toast.show(state.error!, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return AuthButton(
                      buttonName: LocaleKeys.register.tr(),
                      function: () {
                        bloc.unfocus(context);
                        if (bloc.isDataVaild(context)) {
                          bloc.add(SignUpEventStart());
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

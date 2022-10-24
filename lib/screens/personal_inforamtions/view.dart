import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../gen/assets.gen.dart';

class PersonalInformaionScreen extends StatelessWidget {
  const PersonalInformaionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.personalInfo.tr(),
        hight: 50.h,
        hasLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.asset(
                Assets.images.carrots.path,
                width: 88.w,
                height: 83.h,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 5.h),
          Text(
            'محمد على',
            style: mainTextStyle,
          ),
          SizedBox(height: 5.h),
          Text(
            '5466869854+',
            style: TextStyle(color: grayColor, fontSize: 17.sp),
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            name: LocaleKeys.userName.tr(),
            image: Assets.images.person.path,
            changeFillColor: true,
            fillColor: mintgreenColor,
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w),
            child: CustomTextFormField(
              name: LocaleKeys.phone.tr(),
              image: Assets.images.phone.path,
              changeFillColor: true,
              fillColor: mintgreenColor,
              pinCodeWidgetExist: true,
            ),
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            name: LocaleKeys.city.tr(),
            image: Assets.icons.auth.city.path,
            changeFillColor: true,
            fillColor: mintgreenColor,
          ),
          SizedBox(height: 15.h),
          CustomTextFormField(
            name: LocaleKeys.password.tr(),
            image: Assets.images.password.path,
            changeFillColor: true,
            fillColor: mintgreenColor,
            isPassword: true,
          ),
          const Spacer(),
          AuthButton(buttonName: LocaleKeys.changeData.tr()),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }
}

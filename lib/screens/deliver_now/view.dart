import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/screens/home/view.dart';

import '../../../../generated/locale_keys.g.dart';

class DeliverNowScreen extends StatelessWidget {
  const DeliverNowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.dliverNow.tr(),
        hasLeading: true,
        screenName: const Homepage(),
        hight: 120.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                LocaleKeys.moneyInformation.tr(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: FontFamily.bold,
                    color: greenFontColor),
              ),
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              name: LocaleKeys.yourOwnMoney.tr(),
              image: '',
              hasPrefixIcon: false,
              fillColor: mintgreenColor,
              changeFillColor: true,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                LocaleKeys.idInformation.tr(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: FontFamily.bold,
                    color: greenFontColor),
              ),
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: LocaleKeys.name.tr(),
              image: '',
              hasPrefixIcon: false,
              fillColor: mintgreenColor,
              changeFillColor: true,
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: LocaleKeys.idNumber.tr(),
              image: '',
              hasPrefixIcon: false,
              fillColor: mintgreenColor,
              changeFillColor: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180.w,
                  child: CustomTextFormField(
                    name: LocaleKeys.expireDate.tr(),
                    image: '',
                    hasPrefixIcon: false,
                    fillColor: mintgreenColor,
                    changeFillColor: true,
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  child: CustomTextFormField(
                    name: LocaleKeys.serialNumber.tr(),
                    image: '',
                    hasPrefixIcon: false,
                    fillColor: mintgreenColor,
                    changeFillColor: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            AuthButton(buttonName: LocaleKeys.payment.tr()),
          ],
        ),
      ),
    );
  }
}

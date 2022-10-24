import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/styles/styles.dart';

class ConnectWithUs extends StatelessWidget {
  const ConnectWithUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.connectWithUs.tr(),
        hasLeading: true,
        hight: 60.h,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(
                        Assets.images.locationImage.path,
                        width: 342.w,
                        height: 198.h,
                      )),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 150.h, start: 15.w),
                    child: Container(
                      width: 312.w,
                      height: 119.h,
                      decoration: BoxDecoration(
                          color: whiteBackground,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  Assets.images.locationPng.path,
                                  width: 15.w,
                                  height: 15.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'شارع الملك فهد , جدة , المملكة العربية السعودية',
                                  style: secondaryTextStyle.copyWith(
                                      color: blackColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(Assets.images.calling.path),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text('+871544515')
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(Assets.images.message.path),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text('info@thimar.com')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              LocaleKeys.orYouCanSendMessage.tr(),
              style: mainTextStyle,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              name: LocaleKeys.name.tr(),
              image: '',
              hasPrefixIcon: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              name: LocaleKeys.phone.tr(),
              image: '',
              hasPrefixIcon: false,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              name: LocaleKeys.subject.tr(),
              image: '',
              hasPrefixIcon: false,
              changeContainerHeight: true,
              containerHight: 83.h,
              writeMuch: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            AuthButton(buttonName: LocaleKeys.send.tr())
          ],
        ),
      ),
    );
  }
}

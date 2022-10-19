import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/gen/fonts.gen.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/locale_keys.g.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Container(
        height: 100.h,
        width: 342.w,
        decoration: BoxDecoration(
            color: whiteBackground, borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.house.tr(),
                      style:
                          mainTextStyle.copyWith(fontFamily: FontFamily.medium),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        'شقه 40 ',
                        style: TextStyle(
                            color: grayColor,
                            fontFamily: FontFamily.regular,
                            fontSize: 12.sp),
                      ),
                    ),
                    Text(
                      'السعوديه الرياض شارع العليا الرياضي 12342 ',
                      style: TextStyle(
                          color: grayColor,
                          fontFamily: FontFamily.regular,
                          fontSize: 12.sp),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    Assets.images.locationImage.path,
                    width: 72.w,
                    height: 62.h,
                    fit: BoxFit.fill,
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

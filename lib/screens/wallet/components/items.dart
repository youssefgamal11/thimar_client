import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../../core/styles/colors.dart';

class WalletCharge extends StatelessWidget {
  const WalletCharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 83.h,
      decoration: BoxDecoration(
          color: whiteBackground, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.images.cOCODuotoneArrowTop.path,
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  LocaleKeys.chargeWallet.tr(),
                  style: mainTextStyle.copyWith(fontSize: 15.sp),
                ),
                Spacer(),
                Text(
                  'يونيو,2021,',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: FontFamily.light,
                      color: grayColor),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              child: Text(
                '225 ر.س',
                style: mainTextStyle.copyWith(fontSize: 24.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaidForThisProduct extends StatelessWidget {
  const PaidForThisProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 90.h,
      decoration: BoxDecoration(
          color: whiteBackground, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.images.redTopArrow.path,
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  LocaleKeys.youPaidForThisProduct.tr(),
                  style: mainTextStyle.copyWith(fontSize: 15.sp),
                ),
                Spacer(),
                Text(
                  'يونيو,2021,',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: FontFamily.light,
                      color: grayColor),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
              child: Text(
                'طلب #4515',
                style: mainTextStyle.copyWith(fontSize: 13.sp),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 15.w),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        Assets.images.tomato.path,
                        width: 25.w,
                        height: 25.h,
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          Assets.images.carrots.path,
                          width: 25.w,
                          height: 25.h,
                        )),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        Assets.images.tomato.path,
                        width: 25.w,
                        height: 25.h,
                      )),
                  Spacer(),
                  Text(
                    '180 ر.س',
                    style: mainTextStyle.copyWith(
                        fontSize: 13.sp, fontFamily: FontFamily.light),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

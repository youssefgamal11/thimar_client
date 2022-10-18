import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/styles/colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.wallet.tr(),
        hasLeading: true,
        hight: 120.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.yourBalance.tr(),
                style: mainTextStyle.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '225 ر.س',
                style: mainTextStyle.copyWith(fontSize: 24.sp),
              ),
              SizedBox(
                height: 40.h,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [2, 4],
                  strokeWidth: 0.8,
                  radius: Radius.circular(8.r),
                  color: greenButtonColor,
                  child: Container(
                    width: 340.w,
                    height: 45.h,
                    color: mintgreenColor,
                    child: Center(
                        child: Text(LocaleKeys.chargeNow.tr(),
                            style: mainTextStyle)),
                  )),
              SizedBox(
                height: 59.h,
              ),
              Row(
                children: [
                  Text(
                    LocaleKeys.transactionsHistory.tr(),
                    style: mainTextStyle,
                  ),
                  Spacer(),
                  Text(
                    LocaleKeys.showAll.tr(),
                    style: secondaryTextStyle,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 343.w,
                height: 83.h,
                decoration: BoxDecoration(
                    color: whiteBackground,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 8.h),
                        child: Text(
                          '225 ر.س',
                          style: mainTextStyle.copyWith(fontSize: 24.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 343.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: whiteBackground,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 2.h),
                        child: Text(
                          'طلب #4515',
                          style: mainTextStyle.copyWith(fontSize: 13.sp),
                        ),
                      ),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                Assets.images.tomato.path,
                                width: 25.w,
                                height: 25.h,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 2.h),
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

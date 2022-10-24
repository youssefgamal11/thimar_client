import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/locale_keys.g.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({Key? key}) : super(key: key);

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
                RichText(
                  text: TextSpan(
                      style: authGreenTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(text: LocaleKeys.order.tr()),
                        const TextSpan(text: " #4848")
                      ]),
                ),
                Container(
                    width: 95.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                        color: orderStatusColor,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: const Center(
                      child: Text(
                        'انتظار الموافقه',
                        style: TextStyle(color: greenFontColor),
                      ),
                    ))
              ]),
              SizedBox(
                height: 5.h,
              ),
              const Text(
                ' يونيو 2021',
                style: TextStyle(color: dateColor),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(Assets.images.carrots.path)),
                  Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(Assets.images.tomato.path)),
                  Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(Assets.images.carrots.path)),
                  const Spacer(),
                  const Text(
                    '180 ر.س',
                    style: TextStyle(color: greenFontColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

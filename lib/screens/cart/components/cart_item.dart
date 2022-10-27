// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../../core/widgets/buttons/authButton.dart';

class ItemCart extends StatelessWidget {
  ItemCart(
      {Key? key,
      this.image,
      this.productName,
      this.productPrice,
      this.productAmount})
      : super(key: key);
  String? image, productName;
  num? productPrice, productAmount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Container(
          width: 342.w,
          height: 94.h,
          decoration: BoxDecoration(
              color: whiteBackground,
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Container(
                    width: 92.w,
                    height: 78.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            image!,
                          )),
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productName!,
                        style: TextStyle(
                            fontFamily: FontFamily.bold,
                            color: greenFontColor,
                            fontSize: 15.sp),
                      ),
                      Text(
                        '${productPrice!} ر.س',
                        style: TextStyle(
                            fontFamily: FontFamily.bold,
                            color: greenFontColor,
                            fontSize: 13.sp),
                      ),
                      Container(
                        width: 72.w,
                        height: 27.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: mintgreenColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomIconButton(
                                hight: 23.h,
                                width: 23.w,
                                iconColor: greenButtonColor,
                                svgPic: Assets.images.svgImages.add,
                                backgroundColor: whiteBackground),
                            Text(
                              '${productAmount!}',
                              style: TextStyle(
                                  fontFamily: FontFamily.medium,
                                  color: greenFontColor,
                                  fontSize: 11.sp),
                            ),
                            CustomIconButton(
                                hight: 23.h,
                                width: 23.w,
                                iconColor: greenButtonColor,
                                svgPic: Assets.images.svgImages.minus,
                                backgroundColor: whiteBackground),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                CustomIconButton(
                    hight: 27.h,
                    width: 27.w,
                    iconColor: redColor,
                    svgPic: Assets.images.svgImages.trash,
                    backgroundColor: lightPinkColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var textStyle = TextStyle(
  color: greenFontColor,
  fontSize: 15.sp,
  fontFamily: FontFamily.regular,
);

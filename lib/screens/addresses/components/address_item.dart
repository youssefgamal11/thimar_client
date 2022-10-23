import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 97.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: greenButtonColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.house.tr(),
                  style: mainTextStyle,
                ),
                Spacer(),
                CustomIconButton(
                    hight: 24.h,
                    width: 24.w,
                    iconColor: redColor,
                    svgPic: Assets.images.svgImages.trash,
                    backgroundColor: lightPinkColor),
                SizedBox(
                  width: 10.w,
                ),
                CustomIconButton(
                    hight: 24.h,
                    width: 24.w,
                    iconColor: greenFontColor,
                    svgPic: Assets.images.svgImages.edit,
                    backgroundColor: mintgreenColor)
              ],
            ),
            Text(
              "${LocaleKeys.address.tr()} :  119 طريق الملك عبدالعزيز",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: FontFamily.regular,
                  color: greenFontColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Text(
                'الوصف',
                style: TextStyle(
                    color: grayColor,
                    fontSize: 14.sp,
                    fontFamily: FontFamily.light),
              ),
            ),
            Text(
              'رقم الجوال',
              style: TextStyle(
                  color: grayColor,
                  fontSize: 14.sp,
                  fontFamily: FontFamily.light),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/styles.dart';

class ItemPayment extends StatelessWidget {
  ItemPayment(
      {Key? key,
      required this.imagePath,
      this.hasName = false,
      this.paymentName,
      this.isActive = false})
      : super(key: key);
  String? imagePath, paymentName;
  bool hasName, isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            builder: (BuildContext context) {
              return Container(
                width: 376.w,
                height: 317.h,
                decoration: BoxDecoration(
                    color: whiteBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Text(
                        LocaleKeys.savedCards.tr(),
                        style: mainTextStyle,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 5.w),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.vesaBackground.path,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              Assets.images.vesaBackground.path,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          bottom: 20.w, top: 10.h, start: 10.w),
                      child: Row(
                        children: [
                          CustomIconButton(
                            hight: 26.h,
                            width: 26.w,
                            iconColor: greenFontColor,
                            backgroundColor: mintgreenColor,
                            svgPic: Assets.images.svgImages.add,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            LocaleKeys.addCard.tr(),
                            style: mainTextStyle.copyWith(
                                fontFamily: FontFamily.medium),
                          )
                        ],
                      ),
                    ),
                    AuthButton(buttonName: LocaleKeys.confirmChoice.tr())
                  ],
                ),
              );
            });
      },
      child: Container(
        width: 103.w,
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(color: isActive ? greenButtonColor : grayColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath!),
            SizedBox(
              width: 10.w,
            ),
            hasName
                ? Text(
                    paymentName!,
                    style: mainTextStyle,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import '../../../../core/styles/colors.dart';
import '../../../../gen/assets.gen.dart';

class RateItem extends StatelessWidget {
  RateItem({Key? key, this.image, this.productName, this.productPrice})
      : super(key: key);
  String? image, productName, productPrice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Container(
          width: 342.w,
          height: 225.h,
          decoration: BoxDecoration(
              color: whiteBackground,
              borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Container(
                          width: 75.w,
                          height: 64.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.asset(
                            image!,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName!,
                            style: TextStyle(
                                fontFamily: FontFamily.bold,
                                color: greenFontColor,
                                fontSize: 15.sp),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'السعر / كجم',
                            style: TextStyle(
                                fontFamily: FontFamily.light,
                                color: greenFontColor,
                                fontSize: 12.sp),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                '${productPrice!} ر.س',
                                style: TextStyle(
                                    fontFamily: FontFamily.bold,
                                    color: greenFontColor,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '56 ر.س',
                                style: TextStyle(
                                    fontFamily: FontFamily.medium,
                                    color: greenFontColor,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 13.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.h,
                onRatingUpdate: (rating) {
                  print(rating);
                },
                itemBuilder: (context, _) {
                  return const Icon(
                    Icons.star,
                    color: ratebarColor,
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomTextFormField(
                name: LocaleKeys.commentOnProduct.tr(),
                image: '',
                hasPrefixIcon: false,
                changeContainerHeight: true,
                containerHight: 89.h,
                isRateItem: true,
                isPassword: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

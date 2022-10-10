import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/styles/colors.dart';

import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 163.w,
        height: 250.h,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          Assets.images.tomato.path,
                          width: 145.w,
                          height: 117.h,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r)),
                        child: Container(
                          color: greenButtonColor,
                          width: 54.w,
                          height: 20.h,
                          child: Center(
                            child: Text(
                              '45% -',
                              style: TextStyle(
                                  color: discountTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: const Text(
                  'طماطم',
                  style: TextStyle(
                      color: greenFontColor, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                ),
                child: const Text(
                  'السعر /كجم',
                  style: TextStyle(color: priceColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    const Text(
                      '45 ر.س',
                      style: TextStyle(
                          color: greenFontColor, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      '56 ر.س',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: discountPriceColor),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: homeAddButton,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.images.svgImages.add)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: Container(
                  width: 115.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      color: homeAddButton,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.addToTheCart.tr(),
                        style: const TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

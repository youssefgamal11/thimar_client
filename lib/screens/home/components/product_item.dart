// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/gen/fonts.gen.dart';

import '../../../gen/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';

class ItemProduct extends StatelessWidget {
  ItemProduct(
      {Key? key,
      this.addToCartExist = true,
      this.networkImage,
      this.discount,
      this.productName,
      this.amount,
      this.price,
      this.priceBeforeDiscount})
      : super(key: key);
  bool addToCartExist;
  String? networkImage, productName, amount;
  double? discount, price;
  int? priceBeforeDiscount;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 163.w,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Center(
                    child: Container(
                      width: 145.w,
                      height: 117.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            networkImage!,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
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
                            '${discount!}% -',
                            style: TextStyle(
                                color: discountTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Text(
                      productName!,
                      style: const TextStyle(
                          color: greenFontColor, fontFamily: FontFamily.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                    ),
                    child: Text(
                      'السعر /${amount!}',
                      style: const TextStyle(color: priceColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            child: Text(
                              '${price!} ر.س',
                              style: const TextStyle(
                                  color: greenFontColor,
                                  fontFamily: FontFamily.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            child: Text(
                              '$priceBeforeDiscount ر.س',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: discountPriceColor),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: homeAddButton,
                                borderRadius: BorderRadius.circular(5.r)),
                            child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    Assets.images.svgImages.add)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              addToCartExist
                  ? Center(
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
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

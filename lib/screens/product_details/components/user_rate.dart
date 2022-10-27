import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/cart/view.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../gen/assets.gen.dart';

class UsersRate extends StatelessWidget {
  const UsersRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
          width: 267.w,
          height: 95.h,
          decoration: BoxDecoration(
              color: whiteBackground,
              borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'محمد على',
                        style: TextStyle(
                            fontFamily: FontFamily.bold, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      RatingBar.builder(
                          itemBuilder: (context, _) {
                            return const Icon(
                              Icons.star,
                              color: ratebarColor,
                            );
                          },
                          itemSize: 10,
                          itemCount: 5,
                          initialRating: 3,
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          onRatingUpdate: (index) {}),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      width: 180.w,
                      height: 40.h,
                      child: const Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص',
                        maxLines: 2,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    Assets.images.carrots.path,
                    width: 55.w,
                    height: 55.h,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ]),
          )),
    );
  }
}

class BuildSheet extends StatelessWidget {
  BuildSheet(
      {Key? key,
      required this.productAmount,
      required this.productImage,
      required this.productName,
      required this.productsTotalPrice})
      : super(key: key);
  num? productAmount, productsTotalPrice;
  String? productImage, productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 202.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: whiteBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(LocaleKeys.productAddedSuccess.tr(), style: mainTextStyle),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Container(
                  width: 69.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productImage!))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName!,
                        style: mainTextStyle.copyWith(
                            fontFamily: FontFamily.medium),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Text(
                          ' ${LocaleKeys.quantity.tr()} : ${productAmount!}',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: grayColor,
                              fontFamily: FontFamily.light),
                        ),
                      ),
                      Text(
                        '${productsTotalPrice!} ر.س',
                        style: mainTextStyle.copyWith(
                            fontFamily: FontFamily.medium, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                width: 162.w,
                height: 50.h,
                child: AuthButton(
                    buttonName: LocaleKeys.moveToCart.tr(),
                    function: () {
                      navigateTo(leaveHistory: true, page: CartScreen());
                    })),
            SizedBox(
                width: 162.w,
                height: 50.h,
                child: AuthButton(buttonName: LocaleKeys.exploreOffers.tr())),
          ]),
        ],
      ),
    );
  }
}

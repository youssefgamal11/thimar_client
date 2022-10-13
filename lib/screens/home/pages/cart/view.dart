import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/pages/cart/components/cart_items.dart';
import 'package:thimar_app/screens/home/view.dart';

import '../../../../core/widgets/inputs/inputs.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
        hasLeading: true,
        screenName: Homepage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 380.h,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CartItem(
                      image: Assets.images.tomato.path,
                      productName: 'طماطم',
                      productPrice: '50',
                    );
                  }),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              image: Assets.images.star,
              name: LocaleKeys.haveCodeEnterCode.tr(),
              hasPrefixIcon: false,
              removeBorder: true,
              isPassword: false,
              widget: Padding(
                padding: EdgeInsets.all(5.w),
                child: SizedBox(
                  width: 79.w,
                  height: 39.h,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: greenButtonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.apply.tr(),
                        style: TextStyle(
                            color: whiteBackground,
                            fontFamily: FontFamily.bold,
                            fontSize: 15.sp),
                      )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                LocaleKeys.allPricesContain.tr(),
                style: TextStyle(
                    color: greenFontColor,
                    fontFamily: FontFamily.medium,
                    fontSize: 15.sp),
              ),
            ),
            DiscountConainter(
                discount: '40', total: '200', totalAfterDiscount: '160'),
            SizedBox(
              height: 8.h,
            ),
            AuthButton(buttonName: LocaleKeys.goToConfirmOrder.tr())
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/pages/cart/components/cart_items.dart';
import 'package:thimar_app/screens/home/pages/myorders/components/order_item.dart';

import 'components/address_item.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.orderDetails.tr(),
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderItem(),
              SizedBox(height: 15.h),
              Text(
                LocaleKeys.deliveryAddress.tr(),
                style: mainTextStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              AddressDetails(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                LocaleKeys.orderSummary.tr(),
                style: mainTextStyle,
              ),
              SizedBox(
                height: 15.h,
              ),
              DiscountConainter(
                discount: '669',
                total: '989',
                totalAfterDiscount: '320',
                hasPaymentMethod: true,
              ),
              SizedBox(
                height: 182.h,
              ),
              AuthButton(buttonName: LocaleKeys.rateProducts.tr())
            ],
          ),
        ),
      ),
    );
  }
}

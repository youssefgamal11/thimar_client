import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/cart/components/cart_items.dart';
import 'package:thimar_app/screens/home/pages/my_orders/components/order_item.dart';
import 'components/address_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

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
              const ItemOrder(),
              SizedBox(height: 15.h),
              Text(
                LocaleKeys.deliveryAddress.tr(),
                style: mainTextStyle,
              ),
              SizedBox(
                height: 5.h,
              ),
              const AddressDetails(),
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
                discount: 64343,
                total: 468,
                totalAfterDiscount: 343,
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

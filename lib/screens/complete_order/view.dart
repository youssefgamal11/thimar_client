import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/cart/components/cart_items.dart';
import 'package:thimar_app/screens/complete_order/components/payment_item.dart';

class CompleteOrderScreen extends StatelessWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.completeOrder.tr(),
        hasLeading: true,
        hight: 70.h,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(LocaleKeys.name.tr(), style: mainTextStyle),
                    Text(' : محمد ', style: mainTextStyle),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.phone.tr(), style: mainTextStyle),
                    Text(' : 0102357878 ', style: mainTextStyle),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(LocaleKeys.chooseDliveryLocation.tr(),
                        style: mainTextStyle),
                    const Spacer(),
                    CustomIconButton(
                        hight: 26.h,
                        width: 26.w,
                        iconColor: greenButtonColor,
                        svgPic: Assets.images.svgImages.add,
                        backgroundColor: mintgreenColor)
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    name: LocaleKeys.address.tr(),
                    image: 'image',
                    hasPrefixIcon: false,
                    changeContainerHeight: true,
                    containerHight: 33.h),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  LocaleKeys.detectDeliveryTime.tr(),
                  style: mainTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 163.w,
                      height: 60.h,
                      child: CustomTextFormField(
                        hasPrefixIcon: false,
                        image: '',
                        name: LocaleKeys.chooseDayAndDate.tr(),
                        widget: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 17.w, vertical: 17.h),
                          child: Image.asset(
                            Assets.images.date.path,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 163.w,
                      height: 60.h,
                      child: CustomTextFormField(
                        hasPrefixIcon: false,
                        image: '',
                        name: LocaleKeys.chooseTime.tr(),
                        widget: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 17.w, vertical: 17.h),
                          child: Image.asset(
                            Assets.images.time.path,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  LocaleKeys.notes.tr(),
                  style: mainTextStyle,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  name: LocaleKeys.writeYourCommentHere.tr(),
                  hasPrefixIcon: false,
                  image: '',
                  changeContainerHeight: true,
                  containerHight: 117.h,
                  writeMuch: true,
                ),
                SizedBox(height: 20.h),
                Text(
                  LocaleKeys.choosePaymentMethod.tr(),
                  style: mainTextStyle,
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PaymentContainer(
                      imagePath: Assets.images.moneyPng.path,
                      hasName: true,
                      paymentName: LocaleKeys.cash.tr(),
                      isActive: true,
                    ),
                    PaymentContainer(
                      imagePath: Assets.images.visa.path,
                    ),
                    PaymentContainer(
                      imagePath: Assets.images.mastercard.path,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  LocaleKeys.orderSummary.tr(),
                  style: mainTextStyle,
                ),
                SizedBox(height: 15.h),
                DiscountConainter(
                    discount: '40', total: '200', totalAfterDiscount: '160'),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: AuthButton(
              buttonName: LocaleKeys.finishOrder.tr(),
              function: () {},
            ))
      ]),
    );
  }
}

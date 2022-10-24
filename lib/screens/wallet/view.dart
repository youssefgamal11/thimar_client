import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/styles/colors.dart';
import 'components/items.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.wallet.tr(),
        hasLeading: true,
        hight: 120.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.yourBalance.tr(),
                style: mainTextStyle.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '225 ر.س',
                style: mainTextStyle.copyWith(fontSize: 24.sp),
              ),
              SizedBox(
                height: 40.h,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [2, 4],
                  strokeWidth: 0.8,
                  radius: Radius.circular(8.r),
                  color: greenButtonColor,
                  child: Container(
                    width: 340.w,
                    height: 45.h,
                    color: mintgreenColor,
                    child: Center(
                        child: Text(LocaleKeys.chargeNow.tr(),
                            style: mainTextStyle)),
                  )),
              SizedBox(
                height: 59.h,
              ),
              Row(
                children: [
                  Text(
                    LocaleKeys.transactionsHistory.tr(),
                    style: mainTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    LocaleKeys.showAll.tr(),
                    style: secondaryTextStyle,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const WalletCharge(),
              SizedBox(
                height: 10.h,
              ),
              const PaidForThisProduct()
            ],
          ),
        ),
      ),
    );
  }
}

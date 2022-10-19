import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import 'components/row_item.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.changeToVipAccount.tr(),
        hasLeading: true,
        hight: 70.h,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Center(
          child: Column(
            children: [
              Image.asset(Assets.images.bestSeller.path),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '  حساب VIP',
                style: mainTextStyle.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                ' شهريا/ ر.س ',
                style: mainTextStyle.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص ',
                  maxLines: 3,
                  style: TextStyle(
                      color: grayColor,
                      fontFamily: FontFamily.light,
                      fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              RowItems(text: 'تسوق من المتجر ودفع التكاليف شهريا'),
              SizedBox(
                height: 15.h,
              ),
              RowItems(text: 'خصومات وكوبونات مخصصه لك'),
              SizedBox(
                height: 15.h,
              ),
              RowItems(text: 'دعم فني 24/7'),
              SizedBox(
                height: 15.h,
              ),
              RowItems(text: 'تسوق من المتجر ودفع التكاليف شهريا'),
              SizedBox(
                height: 226.h,
              ),
              AuthButton(buttonName: LocaleKeys.order.tr())
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.payment.tr(),
          hasLeading: true,
        ),
        body: Column(
          children: [
            SvgPicture.asset(
              Assets.images.svgImages.vesaImage,
              fit: BoxFit.cover,
            ),
            DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [2, 4],
                strokeWidth: 0.8,
                radius: Radius.circular(8.r),
                child: Container(
                  width: 340.w,
                  height: 45.h,
                  color: mintgreenColor,
                  child: Center(
                      child:
                          Text(LocaleKeys.addCard.tr(), style: mainTextStyle)),
                )),
          ],
        ));
  }
}

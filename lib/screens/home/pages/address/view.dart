import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../gen/assets.gen.dart';
import 'components/address_item.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: LocaleKeys.addresses.tr(), hasLeading: true, hight: 70.h),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              AddressItem(),
              SizedBox(
                height: 15.h,
              ),
              DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [5, 8],
                  strokeWidth: 0.8,
                  radius: Radius.circular(8.r),
                  color: greenButtonColor,
                  child: Container(
                    width: 340.w,
                    height: 45.h,
                    color: mintgreenColor,
                    child: Center(
                        child: Text(LocaleKeys.addAddress.tr(),
                            style: mainTextStyle)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

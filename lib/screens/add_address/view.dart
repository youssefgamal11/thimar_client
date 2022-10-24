import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/styles/colors.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.addAddress.tr(), hasLeading: true),
      body: Column(
        children: [
          SizedBox(
              height: 350.h,
              child: Image.asset(
                Assets.images.locationImage.path,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 10.h,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              CustomTextFormField(
                name: LocaleKeys.typeOfAddress.tr(),
                image: '',
                hasPrefixIcon: false,
                removeBorder: true,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 200.w),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: greenButtonColor,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: greenFontColor),
                                borderRadius: BorderRadius.circular(10.r))),
                        child: Text(
                          LocaleKeys.house.tr(),
                          style: TextStyle(
                              color: whiteBackground,
                              fontSize: 15.sp,
                              fontFamily: FontFamily.light),
                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: whiteBackground,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: grayColor),
                                borderRadius: BorderRadius.circular(10.r))),
                        child: Text(
                          LocaleKeys.work.tr(),
                          style: TextStyle(
                              color: grayColor,
                              fontSize: 15.sp,
                              fontFamily: FontFamily.light),
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            name: LocaleKeys.enterPhoneNumber.tr(),
            image: '',
            hasPrefixIcon: false,
            removeBorder: true,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            name: LocaleKeys.discrption.tr(),
            image: '',
            hasPrefixIcon: false,
            removeBorder: true,
          ),
          SizedBox(
            height: 30.h,
          ),
          AuthButton(buttonName: LocaleKeys.addAddress.tr())
        ],
      ),
    );
  }
}

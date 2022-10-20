import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/pages/my_account/components/screen_data.dart';

import '../../../../gen/assets.gen.dart';

class MyaccountScreen extends StatelessWidget {
  const MyaccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 375.w,
                height: 200.h,
                child: SvgPicture.asset(
                  Assets.images.svgImages.myaccountbackground,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.h),
                  child: Column(children: [
                    Text(
                      LocaleKeys.my_account.tr(),
                      style: TextStyle(
                          color: whiteBackground,
                          fontFamily: 'Bold',
                          fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image(
                          width: 76.w,
                          height: 71.h,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            Assets.images.carrots.path,
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'محمد على',
                      style: TextStyle(
                          color: whiteBackground,
                          fontSize: 14.sp,
                          fontFamily: 'Bold'),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '9663213123+',
                      style: TextStyle(
                          color: mintgreenColor,
                          fontSize: 14.sp,
                          fontFamily: 'Regular'),
                    )
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white),
                child: Column(
                    children: List.generate(screenIcons.length, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      children: [
                        Image.asset(screenIcons[index]),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(screenName[index]),
                        const Spacer(),
                        ImageIcon(AssetImage(Assets.icons.myAccount.go.path))
                      ],
                    ),
                  );
                }))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 5.h),
            child: Row(
              children: [
                Text(LocaleKeys.logout.tr()),
                const Spacer(),
                ImageIcon(AssetImage(Assets.icons.myAccount.logout.path))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

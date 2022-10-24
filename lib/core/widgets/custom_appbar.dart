// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/styles/colors.dart';

import '../../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      required this.title,
      this.hasLeading = false,
      this.hight = kToolbarHeight,
      this.screenName})
      : super(key: key);
  String title;
  double hight;
  bool hasLeading;
  Widget? screenName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appbarColor,
      elevation: 0,
      centerTitle: true,
      leading: hasLeading
          ? LeadingButton(
              screen: screenName,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(color: greenFontColor, fontSize: 20.sp),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hight);
}

class LeadingButton extends StatelessWidget {
  LeadingButton({Key? key, this.screen}) : super(key: key);
  Widget? screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: mintgreenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          onPressed: () {
            navigateTo(leaveHistory: true, page: screen);
          },
          child: SvgPicture.asset(Assets.images.svgImages.arrowRight2)),
    );
  }
}

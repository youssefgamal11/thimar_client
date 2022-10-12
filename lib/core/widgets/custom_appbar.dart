import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.title, this.hight = kToolbarHeight})
      : super(key: key);
  String title;
  double hight;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appbarColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: greenFontColor, fontSize: 20.sp),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hight);
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/gen/assets.gen.dart';

import '../../../../../gen/fonts.gen.dart';

class RowItems extends StatelessWidget {
  const RowItems({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: greenButtonColor,
              radius: 10.w,
              child: Image.asset(Assets.images.right.path)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              text,
              style: mainTextStyle.copyWith(fontFamily: FontFamily.medium),
            ),
          )
        ],
      ),
    );
  }
}

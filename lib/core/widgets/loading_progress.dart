import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';

class LoadingProgress extends StatelessWidget {
  final bool withNoMargin;
  const LoadingProgress({Key? key, this.withNoMargin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: withNoMargin ? null : EdgeInsets.only(top: 20.h),
          child: CircularProgressIndicator(
            strokeWidth: 4.0.w,
            backgroundColor: Colors.grey,
            // valueColor: AlwaysStoppedAnimation(Colors.white),
            color: greenFontColor,
          )),
    );
  }
}

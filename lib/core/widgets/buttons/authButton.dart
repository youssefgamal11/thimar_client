// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';

class AuthButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? function;

  const AuthButton({Key? key, required this.buttonName, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        width: double.infinity.w,
        height: 55.h,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: greenButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r))),
            onPressed: () {
              var currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              function!();
            },
            child: Text(
              buttonName,
              style: authGreyTextStyle.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}

class ResendButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? function;
  final bool? isComplete;
  const ResendButton(
      {Key? key, required this.buttonName, this.function, this.isComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: SizedBox(
        width: 200.w,
        height: 50.h,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: greenFontColor),
                    borderRadius: BorderRadius.circular(17.r))),
            onPressed: function,
            child: Text(
              buttonName,
              style: authGreenTextStyle.copyWith(fontSize: 15.sp),
            )),
      ),
    );
  }
}

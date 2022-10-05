import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../styles/colors.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 58.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(Assets.images.saudiFlag.path),
            width: 32.w,
            height: 32.h,
          ),
          Text(
            '966+',
            style: TextStyle(color: greenButtonColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

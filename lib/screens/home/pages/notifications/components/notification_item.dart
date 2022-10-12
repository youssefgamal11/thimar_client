import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/gen/assets.gen.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 79.h,
      decoration: BoxDecoration(
          color: whiteBackground, borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
            child: Container(
              width: 33.w,
              height: 33.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: mintgreenColor),
              child: Image.asset(Assets.images.orders.path,
                  color: greenButtonColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تم قبول طلبك وجارى تحضيره الان',
                style: TextStyle(
                  fontFamily: 'Medium',
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 30.h,
                width: 279.w,
                child: Text(
                  ' هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Regular',
                    fontSize: 10.sp,
                  ),
                ),
              ),
              Text(
                'منذ ساعتان',
                style: TextStyle(
                  fontFamily: 'Regular',
                  fontSize: 10.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

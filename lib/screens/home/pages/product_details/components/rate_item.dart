import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../gen/assets.gen.dart';

class UsersRate extends StatelessWidget {
  const UsersRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
          width: 267.w,
          height: 87.h,
          decoration: BoxDecoration(
              color: whiteBackground,
              borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'محمد على',
                        style: TextStyle(
                            fontFamily: FontFamily.bold, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      RatingBar.builder(
                          itemBuilder: (context, _) {
                            return const Icon(
                              Icons.star,
                              color: ratebarColor,
                            );
                          },
                          itemSize: 10,
                          itemCount: 5,
                          initialRating: 3,
                          allowHalfRating: true,
                          direction: Axis.horizontal,
                          onRatingUpdate: (index) {}),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      width: 180.w,
                      height: 40.h,
                      child: Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص',
                        maxLines: 2,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    Assets.images.carrots.path,
                    width: 55.w,
                    height: 55.h,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ]),
          )),
    );
  }
}

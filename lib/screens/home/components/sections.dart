import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SectionComponent extends StatelessWidget {
  SectionComponent(
      {Key? key,
      required this.sectionName,
      required this.sectionColor,
      required this.imagePath})
      : super(key: key);
  String sectionName;
  Color sectionColor;
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Container(
            width: 73.w,
            height: 73.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: sectionColor,
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                    image: NetworkImage(imagePath), fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            sectionName,
            style: TextStyle(fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}

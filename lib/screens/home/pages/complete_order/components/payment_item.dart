import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/styles.dart';

class PaymentContainer extends StatelessWidget {
  PaymentContainer(
      {Key? key,
      required this.imagePath,
      this.hasName = false,
      this.paymentName,
      this.isActive = false})
      : super(key: key);
  String? imagePath, paymentName;
  bool hasName, isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 103.w,
      height: 50.h,
      decoration: BoxDecoration(
          border: Border.all(color: isActive ? greenButtonColor : grayColor),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath!),
          SizedBox(
            width: 10.w,
          ),
          hasName
              ? Text(
                  paymentName!,
                  style: mainTextStyle,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

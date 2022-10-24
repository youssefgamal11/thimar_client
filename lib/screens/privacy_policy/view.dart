import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../../../core/styles/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.privacyPolicy.tr(),
        hasLeading: true,
        hight: 70.h,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم ال',
              style: TextStyle(color: grayColor, fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}

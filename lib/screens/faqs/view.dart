import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  bool isCollapse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.knownQuestions.tr(),
          hasLeading: true,
        ),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemCount: 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapse = !isCollapse;
                    });
                  },
                  child: Container(
                    width: 342.w,
                    height: isCollapse ? 50.h : 130.h,
                    decoration: BoxDecoration(
                        color: whiteBackground,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.howToPayWithCredit.tr(),
                                    style:
                                        mainTextStyle.copyWith(fontSize: 15.sp),
                                  ),
                                  const Spacer(),
                                  CustomIconButton(
                                    hight: 25.h,
                                    width: 25.w,
                                    iconColor: greenButtonColor,
                                    backgroundColor: mintgreenColor,
                                    isAssetImage: true,
                                    assetImagePath: isCollapse
                                        ? Assets.images.arrowDown.path
                                        : Assets
                                            .images.cOCODuotoneArrowTop.path,
                                    function: () {
                                      setState(() {
                                        isCollapse = !isCollapse;
                                      });
                                    },
                                  )
                                ],
                              ),
                              isCollapse
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: EdgeInsets.only(top: 15.h),
                                      child: const Text(
                                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق,',
                                        maxLines: 4,
                                      ),
                                    ),
                            ],
                          ),
                        )),
                  ),
                ),
              );
            }));
  }
}

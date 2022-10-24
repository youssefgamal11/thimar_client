import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/styles/styles.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/components/product_item.dart';

class VegtablesScreen extends StatefulWidget {
  const VegtablesScreen({Key? key}) : super(key: key);

  @override
  State<VegtablesScreen> createState() => _VegtablesScreenState();
}

class _VegtablesScreenState extends State<VegtablesScreen> {
  RangeValues selectedRange = const RangeValues(1200, 1500);
  bool? firstValue = false;
  bool? secondValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.vegtables.tr(),
        hight: 70.h,
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                CustomTextFormField(
                  name: LocaleKeys.searchOnWhatYouNeed.tr(),
                  image: Assets.images.search.path,
                  removeBorder: true,
                  changeFillColor: true,
                  fillColor: lightGrayColor,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r)),
                        ),
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                width: 375.w,
                                height: 334.h,
                                decoration: BoxDecoration(
                                    color: whiteBackground,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.r),
                                        topRight: Radius.circular(30.r))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 15.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          LocaleKeys.filter.tr(),
                                          style: mainTextStyle,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Container(
                                          height: 1.h,
                                          color: grayColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
                                        child: Text(
                                          LocaleKeys.price.tr(),
                                          style: mainTextStyle.copyWith(
                                              color: blackColor),
                                        ),
                                      ),
                                      SliderTheme(
                                        data: const SliderThemeData(
                                            trackHeight: 3,
                                            thumbColor: whiteBackground,
                                            rangeThumbShape:
                                                RoundRangeSliderThumbShape(
                                              disabledThumbRadius: 8,
                                              enabledThumbRadius: 8,
                                            ),
                                            inactiveTickMarkColor:
                                                Colors.transparent,
                                            activeTickMarkColor:
                                                Colors.transparent),
                                        child: RangeSlider(
                                          divisions: 20,
                                          values: selectedRange,
                                          onChanged: (newValues) {
                                            setState(() {
                                              selectedRange = newValues;
                                            });
                                          },
                                          min: 0,
                                          max: 2000,
                                          labels: RangeLabels(
                                              '${selectedRange.start}',
                                              '${selectedRange.end}'),
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.ranking.tr(),
                                        style: mainTextStyle.copyWith(
                                            color: blackColor),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: firstValue,
                                              onChanged: (newValue) {
                                                setState(
                                                  () {
                                                    firstValue = newValue;
                                                  },
                                                );
                                              }),
                                          Text(
                                            LocaleKeys.priceFromLowToHigh.tr(),
                                            style: mainTextStyle.copyWith(
                                                fontFamily: FontFamily.medium),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: secondValue,
                                              onChanged: (newValue) {
                                                setState(
                                                  () {
                                                    secondValue = newValue;
                                                  },
                                                );
                                              }),
                                          Text(
                                            LocaleKeys.priceFromHighToLow.tr(),
                                            style: mainTextStyle.copyWith(
                                                fontFamily: FontFamily.medium),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      AuthButton(
                                          buttonName: LocaleKeys.apply.tr())
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 10.0.w),
                    child: SvgPicture.asset(Assets.images.svgImages.filter),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1 / 1.32,
                  ),
                  itemBuilder: (context, index) {
                    return ItemProduct(
                      addToCartExist: false,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

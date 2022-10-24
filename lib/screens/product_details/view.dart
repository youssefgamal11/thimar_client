import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/components/product_item.dart';
import '../../../../gen/assets.gen.dart';
import 'components/rate_item.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> carouselImages = [
    Assets.images.tomato.path,
    Assets.images.tomato.path,
    Assets.images.tomato.path,
    Assets.images.tomato.path,
  ];

  int activeIndex = 0;
// put active index and change states from bloc after you creat itt
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r)),
                    child: CarouselSlider(
                        items: carouselImages
                            .map(
                              (e) => Image.asset(
                                e,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                            viewportFraction: 1,
                            reverse: true,
                            height: 322.h,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 35.h, horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconButton(
                            backgroundColor: mintgreenColor,
                            hight: 32.h,
                            width: 32.h,
                            iconColor: greenButtonColor,
                            svgPic: Assets.images.svgImages.arrowRight2,
                          ),
                          CustomIconButton(
                            backgroundColor: mintgreenColor,
                            hight: 32.h,
                            width: 32.h,
                            iconColor: greenButtonColor,
                            svgPic: Assets.images.svgImages.favourite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 290.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: activeIndex,
                            count: carouselImages.length,
                            effect: WormEffect(
                                activeDotColor: whiteBackground,
                                dotColor: Colors.black12,
                                dotHeight: 7.h,
                                dotWidth: 7.w),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'طماطم',
                              style: TextStyle(
                                  color: greenFontColor,
                                  fontFamily: FontFamily.bold,
                                  fontSize: 22.sp),
                            ),
                            const Spacer(),
                            Text(
                              '40%',
                              style:
                                  TextStyle(color: redColor, fontSize: 15.sp),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: const Text(
                                '45 ر.س',
                                style: TextStyle(
                                    color: greenFontColor,
                                    fontFamily: FontFamily.bold),
                              ),
                            ),
                            const Text(
                              '56 ر.س',
                              style: TextStyle(
                                  color: greenFontColor,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'السعر /1 كيلو',
                              style: TextStyle(
                                  color: dividerColor,
                                  fontFamily: FontFamily.light,
                                  fontSize: 19.sp),
                            ),
                            const Spacer(),
                            Container(
                              width: 109.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: mintgreenColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomIconButton(
                                      hight: 29.h,
                                      width: 29.w,
                                      iconColor: greenButtonColor,
                                      svgPic: Assets.images.svgImages.add,
                                      backgroundColor: whiteBackground),
                                  Text(
                                    '5',
                                    style: TextStyle(
                                        fontFamily: FontFamily.medium,
                                        color: greenFontColor,
                                        fontSize: 15.sp),
                                  ),
                                  CustomIconButton(
                                      hight: 29.h,
                                      width: 29.w,
                                      iconColor: greenButtonColor,
                                      svgPic: Assets.images.svgImages.minus,
                                      backgroundColor: whiteBackground)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              LocaleKeys.productCode.tr(),
                              style: TextStyle(
                                  color: greenFontColor,
                                  fontSize: 17.sp,
                                  fontFamily: FontFamily.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '8432',
                              style: TextStyle(
                                  color: grayColor,
                                  fontSize: 19.sp,
                                  fontFamily: FontFamily.light),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          LocaleKeys.productDetails.tr(),
                          style: TextStyle(
                              color: greenFontColor,
                              fontSize: 17.sp,
                              fontFamily: FontFamily.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          'لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: grayColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          LocaleKeys.rates.tr(),
                          style: TextStyle(
                              color: greenFontColor,
                              fontSize: 17.sp,
                              fontFamily: FontFamily.bold),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(5, (index) {
                            return const UsersRate();
                          })),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          LocaleKeys.similarProducts.tr(),
                          style: TextStyle(
                              color: greenFontColor,
                              fontSize: 17.sp,
                              fontFamily: FontFamily.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(5, (index) {
                            return ItemProduct(
                              addToCartExist: false,
                            );
                          })),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 700.h),
          child: Container(
            width: double.infinity,
            height: 60.h,
            color: greenButtonColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(children: [
                CustomIconButton(
                    hight: 32.h,
                    width: 35.w,
                    iconColor: whiteBackground,
                    svgPic: Assets.images.svgImages.shopcart,
                    backgroundColor: lightGreenColor),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                  child: Text(
                    LocaleKeys.addToTheCart.tr(),
                    style: const TextStyle(
                        color: whiteBackground, fontFamily: FontFamily.bold),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
                  child: const Text(
                    '225 ر.س',
                    style: TextStyle(
                        color: whiteBackground, fontFamily: FontFamily.bold),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    ));
  }
}

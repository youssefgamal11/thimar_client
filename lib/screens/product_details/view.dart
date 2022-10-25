import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/components/product_item.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/states.dart';
import 'package:thimar_app/screens/home/view.dart';
import 'package:thimar_app/screens/product_details/bloc/bloc.dart';
import 'package:thimar_app/screens/product_details/bloc/events.dart';
import '../../../../gen/assets.gen.dart';
import 'bloc/states.dart';
import 'components/rate_item.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);
  final int? productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final bloc = KiwiContainer().resolve<ProductDetailsBloc>();

  @override
  Widget build(BuildContext context) {
    bloc.productId = widget.productId;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder(
                  bloc: bloc..add(GetProductDetailsDataEvent()),
                  builder: (context, state) {
                    if (bloc.productDetailsModel == null) {
                      return Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 150.h),
                        child: const CircularProgressIndicator(),
                      ));
                    } else if (state is ProductsDataFailState) {
                      return const Text('products data faill state');
                    } else {
                      var productDetails = bloc.productDetailsModel!.data!;
                      return Stack(
                        children: [
                          CarouselSlider(
                              items: List.generate(
                                  bloc.productDetailsModel!.data!.images!
                                      .length, (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(25.r),
                                          bottomLeft: Radius.circular(25.r)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(bloc
                                              .productDetailsModel!
                                              .data!
                                              .images![index]
                                              .url!))),
                                );
                              }),
                              options: CarouselOptions(
                                  viewportFraction: 1,
                                  reverse: true,
                                  height: 322.h,
                                  onPageChanged: (index, reason) {
                                    bloc.changeActiveIndex(index);
                                  })),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 35.h, horizontal: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomIconButton(
                                    backgroundColor: mintgreenColor,
                                    hight: 32.h,
                                    width: 32.h,
                                    iconColor: greenButtonColor,
                                    svgPic: Assets.images.svgImages.arrowRight2,
                                    function: () {
                                      navigateTo(
                                        leaveHistory: true,
                                        page: const Homepage(),
                                      );
                                    },
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
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 310.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: bloc.activeIndex,
                                    count: bloc.productDetailsModel!.data!
                                        .images!.length,
                                    effect: WormEffect(
                                        activeDotColor: whiteBackground,
                                        dotColor: Colors.black12,
                                        dotHeight: 7.h,
                                        dotWidth: 7.w),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          productDetails.title!,
                                          style: TextStyle(
                                              color: greenFontColor,
                                              fontFamily: FontFamily.bold,
                                              fontSize: 22.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${productDetails.discount}%',
                                          style: TextStyle(
                                              color: redColor, fontSize: 15.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Text(
                                            '${productDetails.price} ر.س',
                                            style: const TextStyle(
                                                color: greenFontColor,
                                                fontFamily: FontFamily.bold),
                                          ),
                                        ),
                                        Text(
                                          '${productDetails.priceBeforeDiscount} ر.س',
                                          style: const TextStyle(
                                              color: greenFontColor,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'السعر /${productDetails.unit!.name}',
                                          style: TextStyle(
                                              color: grayColor,
                                              fontFamily: FontFamily.light,
                                              fontSize: 19.sp),
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: 109.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: mintgreenColor),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CustomIconButton(
                                                  hight: 29.h,
                                                  width: 29.w,
                                                  iconColor: greenButtonColor,
                                                  svgPic: Assets
                                                      .images.svgImages.add,
                                                  backgroundColor:
                                                      whiteBackground),
                                              Text(
                                                '5',
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.medium,
                                                    color: greenFontColor,
                                                    fontSize: 15.sp),
                                              ),
                                              CustomIconButton(
                                                  hight: 29.h,
                                                  width: 29.w,
                                                  iconColor: greenButtonColor,
                                                  svgPic: Assets
                                                      .images.svgImages.minus,
                                                  backgroundColor:
                                                      whiteBackground)
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
                                          productDetails.code!,
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
                                    Text(
                                      productDetails.description!,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: grayColor),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    BlocBuilder(
                        bloc: bloc..add(GetSimillarProductsEvent()),
                        builder: (context, state) {
                          if (bloc.simillarProductsModel == null) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is SimillarProductsDataFailState) {
                            return Text('simillar products faill state');
                          } else {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: List.generate(
                                      bloc.simillarProductsModel!.data!.length,
                                      (index) {
                                var productData =
                                    bloc.simillarProductsModel!.data![index];

                                return ItemProduct(
                                  addToCartExist: false,
                                  productName: productData.title,
                                  discount: productData.discount,
                                  networkImage: productData.mainImage,
                                  amount: productData.unit!.name,
                                  price: productData.price,
                                  priceBeforeDiscount:
                                      productData.priceBeforeDiscount,
                                  function: () {
                                    navigateTo(
                                        leaveHistory: true,
                                        page: ProductDetailsScreen(
                                          productId: productData.id,
                                        ));
                                  },
                                );
                              })),
                            );
                          }
                        }),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              )
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

// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/screens/cart/view.dart';
import 'package:thimar_app/screens/category_products/view.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/bloc.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/events.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/states.dart';
import 'package:thimar_app/screens/order_details/view.dart';
import 'package:thimar_app/screens/product_details/view.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/inputs/inputs.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../components/product_item.dart';
import '../../components/sections.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = KiwiContainer().resolve<MainBloc>()
      ..add(MainGetSliderDataEvent())
      ..add(MainGetCategoriesDataEvent())
      ..add(MainGetProductsEvent());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    Assets.images.appLogo.path,
                  )),
              Text(
                LocaleKeys.appName.tr(),
                style: TextStyle(
                    color: greenFontColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 40.w,
              ),
              Column(
                children: [
                  Text(
                    LocaleKeys.dliverTo.tr(),
                    style: TextStyle(
                        color: greenFontColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  //change it with user address
                  Text(
                    'شاؤع الملك فهد - جده',
                    style: TextStyle(color: greenFontColor, fontSize: 12.sp),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 37.h,
                width: 32.w,
                child: TextButton(
                    onPressed: () {
                      navigateTo(leaveHistory: true, page: const CartScreen());
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: hearButtonBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                    child: Image.asset(Assets.images.cart.path)),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            name: LocaleKeys.searchOnWhatYouNeed.tr(),
            image: Assets.icons.search.path,
            changeFillColor: true,
            fillColor: searchBarColor,
            removeBorder: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (bloc.sliderModel == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SliderDataFailState) {
                  return const Text('failed slider state');
                } else {
                  return CarouselSlider(
                      items: List.generate(
                        bloc.sliderModel!.data!.length,
                        (index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              bloc.sliderModel!.data![index].media!,
                            ),
                          )),
                        ),
                      ),
                      options: CarouselOptions(
                          autoPlay: true,
                          reverse: true,
                          height: 160.h,
                          viewportFraction: 1));
                }
              }),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text(LocaleKeys.sections.tr()),
                const Spacer(),
                Text(
                  LocaleKeys.seeAll.tr(),
                  style: const TextStyle(color: greenFontColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (bloc.categoriesModel == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategoriesDataFailState) {
                  return const Text('failed category state');
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                          children: List.generate(
                              bloc.categoriesModel!.data!.length, (index) {
                        var categoryData = bloc.categoriesModel!.data![index];
                        return SectionComponent(
                            sectionName: categoryData.name.toString(),
                            sectionColor: vegatableConatinerColor,
                            imagePath: categoryData.media!,
                            function: () {
                              navigateTo(
                                  leaveHistory: true,
                                  page: CategoryProductsScreen(
                                    categoryId: categoryData.id!,
                                    categoryName: categoryData.name!,
                                  ));
                            });
                      })),
                    ),
                  );
                }
              }),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              LocaleKeys.categories.tr(),
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (bloc.productsModel == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductsDataFailState) {
                  return const Text('category products failled state');
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bloc.productsModel!.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 2,
                          childAspectRatio: 163 / 250,
                        ),
                        itemBuilder: (context, index) {
                          var productData = bloc.productsModel!.data![index];
                          return ItemProduct(
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
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/screens/home/components/sections.dart';
import '../../gen/assets.gen.dart';
import 'components/product_item.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  List<String> carouselImages = [
    Assets.images.vegtables.path,
    Assets.images.vegtables.path,
    Assets.images.vegtables.path,
    Assets.images.vegtables.path,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteBackground,
        body: SingleChildScrollView(
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
                        style:
                            TextStyle(color: greenFontColor, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 37.h,
                    width: 32.w,
                    child: TextButton(
                        onPressed: () {},
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
              CarouselSlider(
                  items: carouselImages
                      .map((e) => Image.asset(
                            e,
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      reverse: true,
                      height: 160.h,
                      viewportFraction: 1)),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      SectionComponent(
                          sectionName: LocaleKeys.vegtables.tr(),
                          sectionColor: vegatableConatinerColor,
                          imagePath: Assets.images.svgImages.vegetable),
                      SizedBox(width: 10.w),
                      SectionComponent(
                          sectionName: LocaleKeys.fruits.tr(),
                          sectionColor: fruitsContainerColor,
                          imagePath: Assets.images.svgImages.fruit),
                      SizedBox(width: 10.w),
                      SectionComponent(
                          sectionName: LocaleKeys.steak.tr(),
                          sectionColor: steakContainerColor,
                          imagePath: Assets.images.svgImages.steak),
                      SizedBox(width: 10.w),
                      SectionComponent(
                          sectionName: LocaleKeys.spices.tr(),
                          sectionColor: spicesContainerColor,
                          imagePath: Assets.images.svgImages.spices),
                      SizedBox(width: 10.w),
                      SectionComponent(
                          sectionName: LocaleKeys.dates.tr(),
                          sectionColor: datesContainerColor,
                          imagePath: Assets.images.svgImages.dates),
                      SizedBox(width: 10.w),
                      SectionComponent(
                          sectionName: LocaleKeys.almond.tr(),
                          sectionColor: nutsContainerColor,
                          imagePath: Assets.images.svgImages.almond),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
              ),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return const ProductItem();
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: greenButtonColor,
            selectedItemColor: selectedItemColor,
            unselectedItemColor: unselectedItemColor,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.images.bottomNav.home),
                  label: LocaleKeys.home.tr()),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.images.bottomNav.myOrders),
                  label: LocaleKeys.my_orders.tr()),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.images.bottomNav.notifications),
                  label: LocaleKeys.notifications.tr()),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.images.bottomNav.favoriates),
                  label: LocaleKeys.favorites.tr()),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Assets.images.bottomNav.myAccount),
                  label: LocaleKeys.my_account.tr()),
            ]),
      ),
    );
  }
}

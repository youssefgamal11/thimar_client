// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/screens/home/pages/favourite/view.dart';
import 'package:thimar_app/screens/home/pages/main/view.dart';
import 'package:thimar_app/screens/home/pages/my_orders/view.dart';

import 'package:thimar_app/screens/home/pages/notifications/view.dart';
import '../../gen/assets.gen.dart';
import 'pages/my_account/view.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  List screens = [
    const MainScreen(),
    const MyordersScreen(),
    const NotificationScreen(),
    const FavouriteScreen(),
    const MyaccountScreen(),
  ];
  List bottomNavIcons = [
    Assets.images.bottomNav.home1,
    Assets.images.bottomNav.myOrders,
    Assets.images.bottomNav.notifications,
    Assets.images.bottomNav.favoriates,
    Assets.images.bottomNav.myAccount
  ];
  List bottomNavLabels = [
    LocaleKeys.home.tr(),
    LocaleKeys.my_orders.tr(),
    LocaleKeys.notifications.tr(),
    LocaleKeys.favorites.tr(),
    LocaleKeys.my_account.tr()
  ];

  void changePages(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteBackground,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            changePages(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: greenButtonColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          items: List.generate(screens.length, (index) {
            return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  bottomNavIcons[index],
                  color: currentIndex == index ? Colors.white : null,
                ),
                label: bottomNavLabels[index]);
          }),
        ),
      ),
    );
  }
}

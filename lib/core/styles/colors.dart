import 'package:flutter/material.dart';

const greenFontColor = Color(0xff4C8613);
const greenButtonColor = Color(0xff4C8613);
const whiteBackground = Color(0xffFFFFFF);
const hearButtonBackgroundColor = Color(0xffE8EFE0);
const selectedItemColor = Color(0xffE9F0E2);
const unselectedItemColor = Color(0xffAED489);
const searchBarColor = Color(0xffF5F7F3);
const vegatableConatinerColor = Color(0xffEDF4E7);
const fruitsContainerColor = Color(0xffFCF0D2);
const spicesContainerColor = Color(0xffE9F8FC);
const datesContainerColor = Color(0xffFCE8E2);
const nutsContainerColor = Color(0xffE9EFF5);
const steakContainerColor = Color(0xffF9E1DA);
const priceColor = Color(0xffC7C7C7);
const homeAddButton = Color(0xff61B80C);
const discountPriceColor = Color(0xff5E922B);
const discountTextColor = Color(0xffFFFFFF);
const tabbarBorderColor = Color(0xffF3F3F3);
const tabbarTitleColor = Color(0xffA2A1A4);
const myordersBackgroundColor = Color(0xffFDFDFD);
const orderStatusColor = Color(0xffEDF5E6);
const dateColor = Color(0xff9C9C9C);
const dividerColor = Color(0xffE2EAF2);
const appbarColor = Color(0xffFAFAFA);
const mintgreenColor = Color(0xffF1F6ED);
const lightPinkColor = Color(0xffFFE3E3);
const redColor = Color(0xffFF0000);
const ratebarColor = Color(0xffFF9529);
const grayColor = Color(0xff9C9C9C);
const lightGreenColor = Color(0xff6AA431);
MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

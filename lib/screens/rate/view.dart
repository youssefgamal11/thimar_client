import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/view.dart';
import 'package:thimar_app/screens/rate/components/items.dart';

class RateScreen extends StatelessWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.rateProducts.tr(),
          hasLeading: true,
          screenNameNavigation: const Homepage(),
          hight: 70.h,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 580.h,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ItemRate(
                        image: Assets.images.tomato.path,
                        productName: 'طماطم',
                        productPrice: "50");
                  }),
            ),
            SizedBox(
              height: 15.h,
            ),
            AuthButton(buttonName: LocaleKeys.rate.tr())
          ],
        ));
  }
}

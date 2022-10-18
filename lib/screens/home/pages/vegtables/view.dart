import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/components/product_item.dart';

class VegtablesScreen extends StatelessWidget {
  const VegtablesScreen({Key? key}) : super(key: key);

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
            CustomTextFormField(
              name: LocaleKeys.searchOnWhatYouNeed.tr(),
              image: Assets.images.search.path,
              removeBorder: true,
              widget: SvgPicture.asset(Assets.images.svgImages.filter),
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
                    return ProductItem(
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../../components/product_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.favorites.tr(),
        hight: 50,
      ),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) => ProductItem(
                addToCartExist: false,
              )),
    );
  }
}

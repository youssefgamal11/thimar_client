import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/toast.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/gen/fonts.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/cart/bloc/bloc.dart';
import 'package:thimar_app/screens/cart/bloc/events.dart';
import 'package:thimar_app/screens/cart/bloc/states.dart';
import 'package:thimar_app/screens/cart/components/cart_items.dart';
import 'package:thimar_app/screens/home/view.dart';

import '../../../../core/widgets/inputs/inputs.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<CartBloc>()..add(GetCartDataEvent());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.cart.tr(),
        hasLeading: true,
        screenNameNavigation: const Homepage(),
      ),
      body: SingleChildScrollView(
          child: BlocConsumer(
        bloc: bloc,
        listener: (context, state) {
          if (state is CartDataFailedState) {
            Toast.show(state.error, context);
          }
        },
        builder: (context, state) {
          if (state is CartDataLoadingState) {
            return Center(
                child: Padding(
              padding: EdgeInsets.only(top: 250.h),
              child: const CircularProgressIndicator(),
            ));
          } else if (state is CartDataSucessState) {
            return Column(
              children: [
                Column(
                  children: List.generate(
                      state.model.data!.length,
                      (index) => ItemCart(
                            productAmount: state.model.data![index].amount,
                            image: state.model.data![index].image,
                            productName: state.model.data![index].title,
                            productPrice: state.model.data![index].price,
                          )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  image: Assets.images.star,
                  name: LocaleKeys.haveCodeEnterCode.tr(),
                  hasPrefixIcon: false,
                  removeBorder: true,
                  isPassword: false,
                  widget: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: SizedBox(
                      width: 79.w,
                      height: 39.h,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: greenButtonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.apply.tr(),
                            style: TextStyle(
                                color: whiteBackground,
                                fontFamily: FontFamily.bold,
                                fontSize: 15.sp),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    LocaleKeys.allPricesContain.tr(),
                    style: TextStyle(
                        color: greenFontColor,
                        fontFamily: FontFamily.medium,
                        fontSize: 15.sp),
                  ),
                ),
                DiscountConainter(
                    discount: state.model.totalDiscount!,
                    total: state.model.totalPriceBeforeDiscount!,
                    totalAfterDiscount: state.model.totalPriceWithVat!),
                SizedBox(
                  height: 8.h,
                ),
                AuthButton(buttonName: LocaleKeys.goToConfirmOrder.tr())
              ],
            );
          } else {
            return const Text('CHECK ERROR');
          }
        },
      )),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import '../wallet/components/items.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.transactionsHistory.tr(),
        hasLeading: true,
        hight: 70,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WalletCharge(),
              SizedBox(height: 10.h),
              const PaidForThisProduct(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/widgets/buttons/authButton.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/core/widgets/inputs/inputs.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

class SuggestionsScreen extends StatelessWidget {
  const SuggestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.suggestions.tr(),
        hasLeading: true,
        hight: 80.h,
      ),
      body: Column(
        children: [
          CustomTextFormField(
            name: LocaleKeys.name.tr(),
            image: '',
            hasPrefixIcon: false,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            name: LocaleKeys.phoneNumber.tr(),
            image: '',
            hasPrefixIcon: false,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomTextFormField(
            name: LocaleKeys.subject.tr(),
            image: '',
            hasPrefixIcon: false,
            changeContainerHeight: true,
            containerHight: 83.h,
            writeMuch: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AuthButton(buttonName: LocaleKeys.send.tr())
        ],
      ),
    );
  }
}

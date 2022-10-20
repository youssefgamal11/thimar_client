import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

List screenIcons = [
  Assets.images.myAccount.personlInfo.path,
  Assets.images.myAccount.wallet.path,
  Assets.images.myAccount.addresses.path,
  Assets.images.myAccount.payment.path,
  Assets.images.myAccount.questions.path,
  Assets.images.myAccount.privacy.path,
  Assets.images.myAccount.contactUs.path,
  Assets.images.myAccount.suggestions.path,
  Assets.images.myAccount.share.path,
  Assets.images.myAccount.aboutApp.path,
  Assets.images.myAccount.changeLanguage.path,
  Assets.images.myAccount.conditions.path,
  Assets.images.myAccount.rate.path,
];
List<String> screenName = [
  LocaleKeys.personalInfo.tr(),
  LocaleKeys.wallet.tr(),
  LocaleKeys.address.tr(),
  LocaleKeys.payment.tr(),
  LocaleKeys.knownQuestions.tr(),
  LocaleKeys.privacyPolicy.tr(),
  LocaleKeys.contactWithUs.tr(),
  LocaleKeys.suggestions.tr(),
  LocaleKeys.shareApp.tr(),
  LocaleKeys.aboutApp.tr(),
  LocaleKeys.changeLanguage.tr(),
  LocaleKeys.conditions.tr(),
  LocaleKeys.rateApp.tr(),
];

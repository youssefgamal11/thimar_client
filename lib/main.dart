import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/cache_helper.dart';
import 'package:thimar_app/core/naviagtion.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/core/unfocus.dart';
import 'package:thimar_app/gen/assets.gen.dart';
import 'package:thimar_app/generated/codegen_loader.g.dart';
import 'package:thimar_app/screens/home/pages/about_app/view.dart';
import 'package:thimar_app/screens/home/pages/cart/view.dart';
import 'package:thimar_app/screens/home/pages/complete_order/view.dart';
import 'package:thimar_app/screens/home/pages/deliver_now/view.dart';
import 'package:thimar_app/screens/home/pages/faqs/view.dart';
import 'package:thimar_app/screens/home/pages/myorders/view.dart';
import 'package:thimar_app/screens/home/pages/personal_inforamtions/view.dart';
import 'package:thimar_app/screens/home/pages/privacy_policy/view.dart';
import 'package:thimar_app/screens/home/pages/product_details/view.dart';
import 'package:thimar_app/screens/home/pages/rate/view.dart';
import 'package:thimar_app/screens/home/pages/suggestions_and_complaints/view.dart';
import 'package:thimar_app/screens/home/pages/transaction_history/view.dart';
import 'package:thimar_app/screens/home/pages/wallet/view.dart';
import 'package:thimar_app/screens/home/view.dart';
import 'package:thimar_app/screens/splash/view.dart';
import 'core/bloc_observer.dart';
import 'core/firebase_notification.dart';
import 'core/Kiwi.dart';
import 'package:flutter/services.dart';

import 'screens/home/pages/address/view.dart';
import 'screens/home/pages/connect_us/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  await GlobalNotification().setUpFirebase();

  initKiwi();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: greenFontColor,
  ));
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(
            EasyLocalization(
              child: ScreenUtilInit(
                designSize: const Size(360, 752),
                builder: (context, child) => const MyApp(),
              ),
              supportedLocales: const [Locale('ar'), Locale('en')],
              path: 'assets/translations',
              startLocale: const Locale('ar'),
              fallbackLocale: const Locale('en'),
              saveLocale: true,
              assetLoader: const CodegenLoader(),
            ),
          ));

  // ignore: unused_label
  blocObserver:
  MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          fontFamily: 'Regular',
          primaryColor: greenFontColor,
          primarySwatch: buildMaterialColor(greenFontColor),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: greenButtonColor)),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => UnFocus(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: .85),
          child: child!,
        ),
      ),
      home: FaqsScreen(),
    );
  }
}

import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

// navigateToo(Widget screen) {
//   Navigator.push(navigatorKey.currentContext!,
//       MaterialPageRoute(builder: (context) => screen));
// }

// navigateAndFinish1(Widget screen) {
//   Navigator.pushReplacement(navigatorKey.currentContext!,
//       MaterialPageRoute(builder: (context) => screen));
// }

Future<dynamic> navigateTo({page, bool leaveHistory = true}) {
  return Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      (route) => leaveHistory);
}

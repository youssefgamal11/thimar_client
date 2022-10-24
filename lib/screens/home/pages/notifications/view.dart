import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:thimar_app/core/widgets/custom_appbar.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';

import 'components/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.notifications.tr(),
          hight: 90,
        ),
        body: Column(
          children: const [
            Center(child: NotificationItem()),
          ],
        ));
  }
}

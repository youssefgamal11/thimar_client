import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/generated/locale_keys.g.dart';
import 'package:thimar_app/screens/home/pages/myorders/components/current_items.dart';
import 'package:thimar_app/screens/home/pages/myorders/components/finished_items.dart';

class MyordersScreen extends StatefulWidget {
  const MyordersScreen({Key? key}) : super(key: key);

  @override
  State<MyordersScreen> createState() => _MyordersScreenState();
}

class _MyordersScreenState extends State<MyordersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          LocaleKeys.my_orders.tr(),
          style: TextStyle(color: greenFontColor, fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Container(
                    width: 342.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: whiteBackground,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: tabbarBorderColor)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.h, vertical: 5.h),
                          child: TabBar(
                              controller: tabController,
                              labelColor: whiteBackground,
                              indicatorWeight: 2,
                              unselectedLabelColor: tabbarTitleColor,
                              indicator: BoxDecoration(
                                  color: greenButtonColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              tabs: [
                                Tab(text: LocaleKeys.currentItems.tr()),
                                Tab(
                                  text: LocaleKeys.finishedItems.tr(),
                                )
                              ]),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [CurrentItems(), FinishedItems()],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/screens/auth/signup/bloc/bloc.dart';
import '../../../models/city_model.dart';
import '../failed_state_try_again.dart';
import '/../generated/locale_keys.g.dart';

class ChooseCityDialog extends StatefulWidget {
  final String? selectedCityId;

  const ChooseCityDialog({Key? key, this.selectedCityId}) : super(key: key);

  @override
  State<ChooseCityDialog> createState() => _ChooseCityDialogState();
}

class _ChooseCityDialogState extends State<ChooseCityDialog> {
  final bloc = KiwiContainer().resolve<SignupBloc>()
    ..add(SignUpGetCitiesEventStart());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      height: 300.h,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.clear)),
              Expanded(
                  child: Center(
                      child: Text(LocaleKeys.chooseCity.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              fontFamily: 'Tajawal',
                              color: Colors.black)))),
            ],
          ),
          const Divider(),
          BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is SignUpGetCitiesLoadingState) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 18.0.h),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else if (state is SignUpGetCitiesSucessState) {
                  List<City> cities = state.model.data!;
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pop(context, cities[index]);
                              },
                              child: Container(
                                color: Colors.transparent,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Center(
                                    child: Text(cities[index].name,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: cities[index].id ==
                                                    widget.selectedCityId
                                                ? greenFontColor
                                                : null,
                                            fontFamily: 'Tajawel'))),
                              ),
                            ),
                        itemCount: cities.length,
                        separatorBuilder: (context, index) => const Divider()),
                  );
                } else if (state is SignUpGetCitiesFailState) {
                  return FailedStateTryAgain(
                    msg: state.error,
                    onPress: () {
                      bloc.add(SignUpGetCitiesEventStart());
                    },
                  );
                } else {
                  return const Text("Check states");
                }
              }),
        ],
      ),
    );
  }
}

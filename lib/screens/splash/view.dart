import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _leaveController, _logoController, _curveController;
  Animation<Offset>? _leaveAnimation, _logoAnimation;
  Animation<double>? _curveAnimation;

  @override
  void initState() {
    _leaveController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _logoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _curveController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _leaveAnimation = Tween<Offset>(
            begin: Offset(0, -11.h), end: const Offset(0.0, 0))
        .animate(
            CurvedAnimation(parent: _leaveController!, curve: Curves.linear));

    _logoAnimation = Tween<Offset>(
            begin: Offset(-10.w, 0), end: const Offset(0.0, 0))
        .animate(
            CurvedAnimation(parent: _logoController!, curve: Curves.linear));

    Future.delayed(const Duration(milliseconds: 2500), () {
      _logoController!.forward();
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      _leaveController!.forward();
    });
    Future.delayed(const Duration(milliseconds: 3500), () {
      _curveController!.forward();
    });
    setRotation(-100);

    _curveController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _curveController!.reverse();
      }
    });

    super.initState();
  }

  void setRotation(var degrees) {
    final angle = degrees * pi / 400;
    _curveAnimation =
        Tween<double>(begin: 0, end: angle).animate(_curveController!);
  }

  @override
  void dispose() {
    _curveController!.dispose();
    _logoController!.dispose();
    _leaveController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          Assets.images.svgImages.background,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                  position: _leaveAnimation!,
                  child: SvgPicture.asset(Assets.images.svgImages.treeLeave)),
              SlideTransition(
                position: _logoAnimation!,
                child: Center(
                  child: Stack(children: [
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 140.w,
                            height: 125.h,
                            child: Image.asset(
                              Assets.images.logo.path,
                            ))),
                    AnimatedBuilder(
                      animation: _curveAnimation!,
                      child: Padding(
                        padding: EdgeInsets.only(right: 100.w, top: 25.h),
                        child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                                Assets.images.svgImages.path2)),
                      ),
                      builder: (context, child) => Transform.rotate(
                          angle: _curveAnimation!.value, child: child),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}

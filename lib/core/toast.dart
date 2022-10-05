import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Toast {
  // ignore: non_constant_identifier_names
  static const int lengthShort = 1;

  // ignore: non_constant_identifier_names
  static const int lengthLong = 2;

  // ignore: non_constant_identifier_names
  static const int bottom = 0;

  // ignore: non_constant_identifier_names
  static const int center = 1;

  // ignore: non_constant_identifier_names
  static const int top = 2;

  static void show(
    String msg,
    context, {
    int duration = 2,
    int gravity = 0,
    Color backgroundColor = const Color(0xD04C8613),
    Color textColor = Colors.white,
    double backgroundRadius = 20,
  }) {
    ToastView2.dismiss();
    ToastView2.createView(msg, context, duration, gravity, backgroundColor,
        textColor, backgroundRadius, Border.all(color: Colors.transparent));
  }
}

class ToastView2 {
  static final ToastView2 _singleton = ToastView2._internal();

  factory ToastView2() {
    return _singleton;
  }

  ToastView2._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool? _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border border) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget2(
          widget: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius.r),
                    border: border,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Text(msg,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 15.sp, color: textColor)),
                )),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await Future.delayed(Duration(seconds: duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible!) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget2 extends StatelessWidget {
  const ToastWidget2({
    Key? key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget? widget;
  final int? gravity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: gravity == 2 ? 50 : null,
        bottom: gravity == 0 ? 100 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}

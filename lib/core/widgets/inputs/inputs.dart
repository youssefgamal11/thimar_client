import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/styles/colors.dart';
import 'package:thimar_app/gen/fonts.gen.dart';

import '../pin_code.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String name;
  late String image;
  final TextEditingController? controller;
  final VoidCallback? onWidgetPressed;
  final TextInputAction inputAction;
  final TextInputType? keyboardType;
  final Color? labelColor;
  final bool isPassword, isEnabled, hasPrefixIcon, changeContainerHeight;
  final Widget? widget;
  bool isSecure,
      pinCodeWidgetExist,
      isCitySelection,
      changeFillColor,
      removeBorder,
      isRateItem;
  Color? fillColor;
  double? containerHight;

  CustomTextFormField(
      {Key? key,
      required this.name,
      required this.image,
      this.changeContainerHeight = false,
      this.widget,
      this.containerHight,
      this.controller,
      this.keyboardType,
      this.isRateItem = false,
      this.inputAction = TextInputAction.next,
      this.onWidgetPressed,
      this.labelColor,
      this.pinCodeWidgetExist = false,
      this.isPassword = false,
      this.isEnabled = true,
      this.isSecure = true,
      this.changeFillColor = false,
      this.isCitySelection = false,
      this.fillColor,
      this.removeBorder = false,
      this.hasPrefixIcon = true})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.pinCodeWidgetExist ? const PinCodeWidget() : const Text(''),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!widget.isEnabled) {
                widget.onWidgetPressed!();
              }
            },
            child: Container(
              height:
                  widget.changeContainerHeight ? widget.containerHight : 60.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.changeFillColor ? widget.fillColor : Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: widget.removeBorder
                        ? Colors.white
                        : Colors.grey.shade300),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: widget.isRateItem ? 35.h : 0.h),
                child: TextFormField(
                  cursorHeight: 20.h,
                  onTap: () {},
                  cursorColor: greenFontColor,
                  keyboardType: widget.keyboardType,
                  textDirection: TextDirection.rtl,
                  controller: widget.controller,
                  enabled: widget.isEnabled,
                  textInputAction: widget.inputAction,
                  obscureText: widget.isSecure,
                  style: const TextStyle(color: greenFontColor),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      isDense: true,
                      labelText: widget.name,
                      hintMaxLines: 1,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      labelStyle: TextStyle(
                        color: widget.labelColor ?? const Color(0xffB1B1B1),
                        fontSize: 15.sp,
                        fontFamily: FontFamily.regular,
                      ),
                      prefixIcon: widget.hasPrefixIcon
                          ? Image.asset(widget.image)
                          : null,
                      suffixIcon: widget.isPassword
                          ? GestureDetector(
                              onTap: () {
                                widget.isSecure = !widget.isSecure;
                                setState(() {});
                              },
                              child: Icon(widget.isSecure
                                  ? Icons.visibility_off
                                  : Icons.visibility))
                          : widget.widget),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class CustomTextFormFieldForPassword extends StatefulWidget {
//   final String name;
//   final String image;
//   final TextEditingController? controller;
//   final onWidgetPressed;
//   final isEnabled;
//   final isCitySelection;
//   final inputAction;
//   final TextInputType? keyboardType;
//   final labelColor;
//   bool isPassword;
//   bool isSecure;

//   CustomTextFormFieldForPassword(
//       {Key? key,
//       required this.name,
//       required this.image,
//       this.controller,
//       this.keyboardType,
//       this.inputAction = TextInputAction.next,
//       this.onWidgetPressed,
//       this.labelColor,
//       this.isPassword = false,
//       this.isEnabled = true,
//       this.isSecure = true,
//       this.isCitySelection = false})
//       : super(key: key);

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldForPasswordState extends State<CustomTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12.0, right: 12),
//       child: GestureDetector(
//         onTap: () {
//           if (!widget.isEnabled) {
//             widget.onWidgetPressed();
//           }
//         },
//         child: Container(
//           height: 60.h,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15.r),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: TextFormField(
//             cursorHeight: 20.h,
//             cursorColor: greenFontColor,
//             keyboardType: widget.keyboardType,
//             textDirection: TextDirection.rtl,
//             controller: widget.controller,
//             enabled: widget.isEnabled,
//             textInputAction: widget.inputAction,
//             obscureText: widget.isSecure,
//             decoration: InputDecoration(
//                 labelText: widget.name,
//                 hintMaxLines: 1,
//                 border: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 labelStyle: TextStyle(
//                   color: widget.labelColor ?? const Color(0xffB1B1B1),
//                   fontSize: 15.sp,
//                   fontFamily: 'Tajawel',
//                 ),
//                 prefixIcon: Image.asset(widget.image),
//                 suffixIcon: widget.isPassword
//                     ? IconButton(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onPressed: () {
//                           if (widget.isSecure == true) {
//                             setState(() {
//                               widget.isSecure = false;
//                             });
//                           } else {
//                             setState(() {
//                               widget.isSecure = true;
//                             });
//                           }
//                           ;
//                         },
//                         icon: widget.isSecure
//                             ? Icon(Icons.visibility_off)
//                             : Icon(Icons.visibility))
//                     : null),
//           ),
//         ),
//       ),
//     );
//   }
// }

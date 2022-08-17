import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String name;
  final String image;

  const CustomTextFormField({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12),
      child: Container(
        height: 60,
        decoration: BoxDecoration(),
        child: TextFormField(
          cursorHeight: 20,
          keyboardType: TextInputType.text,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: widget.name,
            hintTextDirection: TextDirection.rtl,
            hintStyle: authGreyTextStyle,
            suffixIcon: Image.asset(widget.image),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
      ),
    );
  }
}

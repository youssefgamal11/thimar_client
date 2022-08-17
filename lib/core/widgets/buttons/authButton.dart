import 'package:flutter/material.dart';
import '../../../styles/color.dart';
import '../../../styles/styles.dart';

class AuthButton extends StatelessWidget {
  final String buttonName;
  const AuthButton({Key? key, required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: greenButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text(
              buttonName,
              style: authGreyTextStyle.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}

class ResendButton extends StatelessWidget {
  final String ButtonName;
  const ResendButton({Key? key, required this.ButtonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: SizedBox(
        width: 200,
        height: 50,
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: greenFontColor),
                    borderRadius: BorderRadius.circular(17))),
            onPressed: () {},
            child: Text(
              ButtonName,
              style: authGreenTextStyle.copyWith(fontSize: 15),
            )),
      ),
    );
  }
}

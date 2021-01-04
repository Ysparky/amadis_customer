import 'package:amadis_customer/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key key, this.text, this.onPressed}) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text(text),
      ),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: AmadisColors.primaryColor,
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }
}

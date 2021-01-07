import 'package:amadis_customer/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class FieldColumn extends StatelessWidget {
  const FieldColumn({Key key, this.inputText, this.textFormField})
      : super(key: key);

  final String inputText;
  final TextFormField textFormField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          inputText,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: hp(1)),
        textFormField,
      ],
    );
  }
}

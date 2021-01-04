import 'package:flutter/material.dart';

class XD extends StatelessWidget {
  const XD({Key key, this.inputText, this.textFormField}) : super(key: key);

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
        SizedBox(
          height: 7,
        ),
        textFormField,
      ],
    );
  }
}

import 'package:amadis_customer/core/utils/responsive.dart';
import 'package:amadis_customer/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class FieldColumn extends StatelessWidget {
  const FieldColumn({
    Key key,
    this.inputText,
    this.customFormField,
  }) : super(key: key);

  final String inputText;
  final CustomFormField customFormField;

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
        customFormField,
      ],
    );
  }
}

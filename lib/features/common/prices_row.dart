import 'package:flutter/material.dart';

import 'package:amadis_customer/utils/constants.dart';

class PricesRow extends StatelessWidget {
  const PricesRow({
    Key key,
    @required this.text,
    @required this.value,
  }) : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$text :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}

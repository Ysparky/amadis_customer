import 'package:amadis_customer/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class TableHeaderItem extends StatelessWidget {
  TableHeaderItem({
    Key key,
    @required this.text,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: hp(0.5), horizontal: wp(0.5)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w900,
                ),
          ),
        ),
      ),
    );
  }
}
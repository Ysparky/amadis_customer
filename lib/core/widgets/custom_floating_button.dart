import 'package:amadis_customer/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key key,
    this.backgroundColor = AmadisColors.primaryColor,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final Icon icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 50.0,
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        child: icon,
        heroTag: null,
        onPressed: onPressed,
      ),
    );
  }
}
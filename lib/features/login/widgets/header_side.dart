import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeaderSide extends StatelessWidget {
  const HeaderSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: hp(30),
      width: double.infinity,
      child: CustomPaint(
        painter: HeaderPainter(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: hp(5)),
          child: Container(
            height: hp(25),
            width: hp(25),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AmadisAssets.logo),
                fit: BoxFit.none,
                scale: hp(0.35),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

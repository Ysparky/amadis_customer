import 'package:amadis_customer/core/utils/colors.dart';
import 'package:flutter/material.dart';

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AmadisColors.primaryColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    final totalWidth = size.width;

    final totalHeight = size.height;
    final tipHeight = size.height * 1.05;

    final path = Path()
      ..lineTo(totalWidth, 0)
      ..lineTo(totalWidth, totalHeight)
      ..lineTo(totalWidth - (size.width * 0.8), totalHeight)
      ..lineTo(totalWidth * 0.15, tipHeight)
      ..lineTo(totalWidth * 0.1, totalHeight)
      ..lineTo(0, totalHeight)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HeaderPainter oldDelegate) => true;
}

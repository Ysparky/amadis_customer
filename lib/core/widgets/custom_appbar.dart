import 'package:amadis_customer/core/utils/colors.dart';
import 'package:amadis_customer/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    this.headerActions,
    this.headerTitle,
    this.implyLeading = true,
  }) : super(
          backgroundColor: AmadisColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: hp(7),
          title: Text(headerTitle),
          actions: headerActions,
          automaticallyImplyLeading: implyLeading,
        );

  final List<Widget> headerActions;
  final String headerTitle;
  final bool implyLeading;
}

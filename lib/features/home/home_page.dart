import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AmadisColors.backgroundColor,
      appBar: CustomAppBar(headerTitle: 'Home'),
      body: Center(
        child: FloatingActionButton(
          child: Icon(Icons.g_translate_sharp),
          onPressed: () =>
              ExtendedNavigator.root.push(Routes.paymentMethodPage),
        ),
      ),
    );
  }
}

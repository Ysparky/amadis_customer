import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AmadisColors.backgroundColor,
      appBar: CustomAppBar(headerTitle: 'Mis Pedidos'),
    );
  }
}

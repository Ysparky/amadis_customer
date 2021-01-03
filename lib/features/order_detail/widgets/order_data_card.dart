import 'package:flutter/material.dart';

import 'package:amadis_customer/models/order.dart';
import 'package:amadis_customer/utils/constants.dart';
import 'package:amadis_customer/utils/responsive.dart';

class OrderDataCard extends StatelessWidget {
  const OrderDataCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Datos del pedido',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: hp(1)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(order.location.address)),
                const SizedBox(width: 10.0),
                Text(order.shippingDate, textAlign: TextAlign.right),
              ],
            ),
            SizedBox(height: hp(1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text((order.location.reference == null ||
                          order.location.reference.isEmpty)
                      ? 'No hay referencia especificada'
                      : order.location.reference),
                ),
                Text(
                  orderStates
                      .singleWhere(
                          (element) => element.id == order.orderStateId)
                      .name,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

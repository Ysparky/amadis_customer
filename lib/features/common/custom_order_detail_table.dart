import 'package:flutter/material.dart';

import 'package:amadis_customer/features/common/prices_row.dart';
import 'package:amadis_customer/models/order_detail.dart';
import 'package:amadis_customer/utils/constants.dart';
import 'package:amadis_customer/utils/responsive.dart';

class CustomOrderDetailTable extends StatelessWidget {
  CustomOrderDetailTable({Key key, this.ordersDetail}) : super(key: key);
  final List<OrderDetail> ordersDetail;

  final _bodyRowItem = (String rowText) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(rowText, textAlign: TextAlign.center),
      );

  final _headerRowItem = (String headerText) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          headerText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor.withOpacity(0.8)),
        ),
      );

  List<TableRow> _buildTableRows(List<OrderDetail> details) {
    return details
        .map(
          (e) => TableRow(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            children: [
              _bodyRowItem(e.product.name),
              _bodyRowItem(e.quantity.toString()),
              _bodyRowItem('S/. ${e.product.price.toStringAsFixed(2)}'),
            ],
          ),
        )
        .toList();
  }

  double _getTotalAmount(List<OrderDetail> ordersDetail) {
    var totalAmount = 0.0;
    ordersDetail.forEach((element) {
      final productPrice = element.quantity * element.product.price;
      totalAmount += productPrice;
    });
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
          ),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              verticalInside: BorderSide(width: 0.5, color: kPrimaryColor),
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.5),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                ),
                children: [
                  _headerRowItem('PRODUCTO'),
                  _headerRowItem('CANTIDAD\n(cajas)'),
                  _headerRowItem('PRECIO UNITARIO'),
                ],
              ),
              ..._buildTableRows(ordersDetail),
            ],
          ),
        ),
        SizedBox(height: hp(1.0)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(2)),
          child: PricesRow(
            text: 'Subtotal',
            value: 'S/. ${_getTotalAmount(ordersDetail).toStringAsFixed(2)}',
          ),
        ),
      ],
    );
  }
}

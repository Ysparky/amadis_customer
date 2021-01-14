import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailCard extends StatelessWidget {
  OrderDetailCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<OrderDetailViewModel>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detalle',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: hp(1.0)),
                Text(
                  orderTypes
                      .singleWhere(
                          (oT) => oT.id == _viewModel.order.orderTypeId)
                      .name,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            SizedBox(height: hp(2.0)),
            Ink(
              decoration: BoxDecoration(color: Colors.indigo[50]),
              child: Row(
                children: [
                  TableHeaderItem(text: 'Producto'),
                  TableHeaderItem(text: 'Cantidad\n(cajas)'),
                  TableHeaderItem(text: 'Prec. Unit.'),
                  TableHeaderItem(text: 'Subtotal'),
                ],
              ),
            ),
            ..._viewModel.order.ordersDetail
                .map(
                  (detail) => CustomTableBody(
                    showDivider: _viewModel.order.ordersDetail.last != detail,
                    children: [
                      Expanded(
                        child: Text(
                          detail.productPresentation.product.name +
                              ' ' +
                              detail.productPresentation.presentation.name,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${detail.quantity}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          detail.productPresentation.price.toStringAsFixed(2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          detail.totalPrice?.toStringAsFixed(2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            SizedBox(height: hp(2.0)),
            PricesRow(
              text: 'Subtotal',
              value: 'S/. ${_viewModel.calculateSubtotal().toStringAsFixed(2)}',
            ),
            PricesRow(
              text:
                  '${_viewModel.order.missingBottlesQuantity} botellas faltantes',
              value: 'S/. 100.00',
            ),
            PricesRow(
              text:
                  '${_viewModel.order.missingBottlesQuantity} cajas faltantes',
              value: 'S/. 100.00',
            ),
          ],
        ),
      ),
    );
  }
}

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
        Expanded(
          child: Text(
            '$text :',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: AmadisColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

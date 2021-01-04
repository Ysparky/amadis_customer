import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDataCard extends StatelessWidget {
  const CustomerDataCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<OrderDetailViewModel>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Datos del cliente',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: hp(1)),
                  Text(
                    _viewModel.order.customer,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: hp(1)),
                  Text(
                    _viewModel.order.contactNumber,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

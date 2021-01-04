import 'package:amadis_customer/core/utils/loading_overlay.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderDetailViewModel(order))
      ],
      child: LoadingOverlay<OrderDetailViewModel>(
        child: OrderDetailPageBase(),
      ),
    );
  }
}

class OrderDetailPageBase extends StatelessWidget {
  const OrderDetailPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

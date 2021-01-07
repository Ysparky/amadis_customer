import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:amadis_customer/features/order_detail/widgets/widgets.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/networking/api_response.dart';
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
        ChangeNotifierProvider(create: (_) => OrderDetailViewModel(order.id))
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
    final _viewModel = Provider.of<OrderDetailViewModel>(context);
    return Scaffold(
      key: _viewModel.scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: AmadisColors.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomFloatingButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: _viewModel.goBack,
            ),
          ],
        ),
      ),
      body: StreamBuilder<ApiResponse<Order>>(
        stream: _viewModel.fullOrder,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data.status) {
              case Status.LOADING:
                return ShimmerLoader();
                break;
              case Status.COMPLETED:
                return OrderContainer();
                break;
              case Status.ERROR:
                return Error(
                  errorMessage: snapshot.data.message,
                );
                break;
              default:
                return ShimmerLoader();
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

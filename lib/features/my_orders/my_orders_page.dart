import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/my_orders/my_orders_view_model.dart';
import 'package:amadis_customer/features/my_orders/widgets/widgets.dart';
import 'package:amadis_customer/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListOrdersViewModel()),
      ],
      child: LoadingOverlay<ListOrdersViewModel>(
        child: MyOrdersPageBase(),
      ),
    );
  }
}

class MyOrdersPageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ListOrdersViewModel>(context);
    return Scaffold(
        backgroundColor: AmadisColors.backgroundColor,
        appBar: CustomAppBar(headerTitle: 'Mis Pedidos'),
        body: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
          child: Container(
            height: hp(100),
            width: double.infinity,
            color: Color(0xffF6F6F6),
            child: RefreshIndicator(
              onRefresh: () => _viewModel.orderService
                  .getOrders(stateId: _viewModel.activeState.id),
              color: AmadisColors.secondaryColor,
              child: StreamBuilder(
                stream: _viewModel.orders,
                builder: (_, AsyncSnapshot<List<Order>> snapshot) {
                  if (snapshot.hasData) {
                    final orders = snapshot.data;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: snapshot.data.isEmpty
                          ? EmptyOrdersList()
                          : ListView.builder(
                              padding: EdgeInsets.only(bottom: hp(5)),
                              physics: AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: orders.length,
                              itemBuilder: (_, index) =>
                                  OrderCardItem(order: orders[index]),
                            ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ));
  }
}

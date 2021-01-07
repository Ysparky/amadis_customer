import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/my_orders/my_orders_view_model.dart';
import 'package:amadis_customer/features/my_orders/widgets/widgets.dart';
import 'package:amadis_customer/models/order.dart';
import 'package:amadis_customer/networking/api_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key key, this.initialStateId = 1}) : super(key: key);

  final int initialStateId;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MyOrdersViewModel(initialStateId),
        ),
      ],
      child: LoadingOverlay<MyOrdersViewModel>(
        child: MyOrdersPageBase(),
      ),
    );
  }
}

class MyOrdersPageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<MyOrdersViewModel>(context);
    return Scaffold(
      backgroundColor: AmadisColors.backgroundColor,
      appBar: CustomAppBar(headerTitle: 'Mis Pedidos'),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        child: Container(
          height: hp(100),
          width: double.infinity,
          color: AmadisColors.backgroundColor,
          child: Column(
            children: [
              Container(
                height: hp(7),
                width: double.infinity,
                margin: EdgeInsets.only(top: hp(1)),
                child: ListView.builder(
                  padding: EdgeInsets.only(left: wp(2), right: wp(2)),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: _viewModel.ordersState.length,
                  itemBuilder: (BuildContext context, int index) {
                    final state = _viewModel.ordersState[index];
                    return OrderStateItem(state: state);
                  },
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => _viewModel.orderService
                      .getOrders(stateId: _viewModel.activeState.id),
                  color: AmadisColors.secondaryColor,
                  child: StreamBuilder<ApiResponse<List<Order>>>(
                    stream: _viewModel.orders2,
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return Center(child: CircularProgressIndicator());
                            break;
                          case Status.COMPLETED:
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: snapshot.data.data.isEmpty
                                  ? EmptyOrdersList()
                                  : ListView.builder(
                                      padding: EdgeInsets.only(bottom: hp(5)),
                                      physics: AlwaysScrollableScrollPhysics(
                                        parent: BouncingScrollPhysics(),
                                      ),
                                      itemCount: snapshot.data.data.length,
                                      itemBuilder: (_, index) => OrderCardItem(
                                          order: snapshot.data.data[index]),
                                    ),
                            );
                            break;
                          case Status.ERROR:
                            return Error(
                                errorMessage: snapshot.data.message,
                                onRetryPressed: () => _viewModel.orderService
                                    .getOrders(
                                        stateId: _viewModel.activeState.id));
                            break;
                          default:
                            return Center(child: CircularProgressIndicator());
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

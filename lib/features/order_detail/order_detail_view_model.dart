import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/services/order_service.dart';
import 'package:auto_route/auto_route.dart';

class OrderDetailViewModel extends AmadisViewModel {
  OrderDetailViewModel(this.order);

  final Order order;

  final _orderService = injector<OrderService>();

  Order _fullOrder;
  Order get fullOrder => _fullOrder;

  void goBack() => ExtendedNavigator.root.pop();

  Future<void> getOrderDetailById() async {
    _fullOrder = await _orderService.getOrderById(order.id);
  }
}

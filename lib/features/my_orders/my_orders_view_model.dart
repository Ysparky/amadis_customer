import 'package:amadis_customer/core/utils/view_model.dart';
import 'package:amadis_customer/core/utils/data.dart';
import 'package:amadis_customer/core/utils/service_injector.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/models/order.dart';
import 'package:amadis_customer/services/order_service.dart';

class ListOrdersViewModel extends AmadisViewModel {
  ListOrdersViewModel() {
    orderService.getOrders();
    _statesList = orderStates.toList();
    _activeState = _statesList.elementAt(1);
  }

  final orderService = injector<OrderService>();

  Stream<List<Order>> get orders => orderService.orders;

  List<OrderState> _statesList = [];
  List<OrderState> get ordersState => _statesList;

  OrderState _activeState;
  OrderState get activeState => _activeState;

  Future<void> getOrders(int stateId) async {
    setLoading(true);
    await orderService.getOrders(stateId: stateId);
    setLoading(false);
    notifyListeners();
  }

  void handleTap(OrderState orderState) {
    final index = _statesList.indexWhere((state) => state.selected);
    final idx = _statesList.indexOf(orderState);
    if (index != idx) {
      _statesList[index] = _statesList[index].copyWith(selected: false);
      _statesList[idx] = _statesList[idx].copyWith(selected: true);
      _activeState = _statesList[idx];
      getOrders(orderState.id);
      notifyListeners();
    }
  }
}

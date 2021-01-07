import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/networking/api_base_helper.dart';
import 'package:amadis_customer/networking/api_response.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class OrderService {
  OrderService() {
    orders = BehaviorSubject<ApiResponse<List<Order>>>.seeded(null);
    order = BehaviorSubject<ApiResponse<Order>>.seeded(null);
  }

  BehaviorSubject<ApiResponse<List<Order>>> orders;
  BehaviorSubject<ApiResponse<Order>> order;

  final _dio = Dio();
  final _endpoint = '$BASE_URL/orders/';
  final _prefs = SharedPrefs();

  final _helper = ApiBaseHelper();

  Future<void> getOrders({int stateId = 1}) async {
    orders.add(ApiResponse.loading('Fetching orders'));
    final params = {'orderStateId': stateId, 'customerId': _prefs.customerId};
    final response = await _helper.get('/orders/', params: params);
    if (response.data != null) {
      final _orders =
          List<Order>.from(response.data.map((x) => Order.fromJson(x)));
      orders.add(ApiResponse.completed(_orders));
    } else {
      orders.add(ApiResponse.error(response.message, response.statusCode));
    }
  }

  Future<void> getOrderById(int id) async {
    order.add(ApiResponse.loading('Fetching order detail'));
    final response = await _helper.get('/orders/$id');
    if (response.data != null) {
      final _order = Order.fromJson(response.data);
      order.add(ApiResponse.completed(_order));
    } else {
      order.add(ApiResponse.error(response.message, response.statusCode));
    }
  }

  Future<ApiResponse> registerPayment2(int orderId, double amount) async {
    final data = {
      'amount': amount,
      'orderId': orderId,
      'paymentMethodId': 1,
    };

    return await _helper.post('/payment/', body: data);
  }

  Future registerPayment(int orderId, double amount) async {
    try {
      final endpoint = '$BASE_URL/payment/';
      final data = {
        'amount': amount,
        'orderId': orderId,
        'paymentMethodId': 1,
      };
      final response = await _dio.post(
        endpoint,
        data: data,
        options: dioOptions,
      );
      print(response.data['data']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}

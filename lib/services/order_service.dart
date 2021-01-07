import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/networking/api_base_helper.dart';
import 'package:amadis_customer/networking/api_response.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class OrderService {
  OrderService() {
    orders = BehaviorSubject<List<Order>>.seeded(null);
    orders2 = BehaviorSubject<ApiResponse<List<Order>>>.seeded(null);
  }

  BehaviorSubject<List<Order>> orders;
  BehaviorSubject<ApiResponse<List<Order>>> orders2;

  final _dio = Dio();
  final _endpoint = '$BASE_URL/orders/';
  final _prefs = SharedPrefs();

  final _helper = ApiBaseHelper();

  Future<void> getOrders({int stateId = 1}) async {
    orders2.add(ApiResponse.loading('Fetching orders'));
    final params = {'orderStateId': stateId, 'customerId': _prefs.customerId};
    final response = await _helper.get('/orders/', params: params);
    if (response.data != null) {
      final _orders =
          List<Order>.from(response.data.map((x) => Order.fromJson(x)));
      orders2.add(ApiResponse.completed(_orders));
    } else {
      orders2.add(ApiResponse.error(response.message, response.statusCode));
    }
  }

  Future<ApiResponse> getOrderById2(int id) async {
    return await _helper.get('/orders/$id');
  }

  Future<Order> getOrderById(int id) async {
    try {
      final response = await _dio.get('$_endpoint$id', options: dioOptions);
      return Order.fromJson(response.data['data']);
    } catch (e) {
      print(e.toString());
      return null;
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

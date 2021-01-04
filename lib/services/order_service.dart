import 'package:amadis_customer/core/utils/shared_prefs.dart';
import 'package:dio/dio.dart';

import 'package:amadis_customer/core/utils/constants.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:rxdart/rxdart.dart';

class OrderService {
  OrderService() {
    orders = BehaviorSubject<List<Order>>.seeded(null);
  }

  BehaviorSubject<List<Order>> orders;
  final _prefs = SharedPrefs();

  final _dio = Dio();
  final _endpoint = '$BASE_URL/orders/';

  Future<void> getOrders({int stateId = 1}) async {
    try {
      print('orderStateId $stateId');
      final params = {
        'orderStateId': stateId,
        'customerId': _prefs.customerId,
      };
      final response = await _dio.get(
        _endpoint,
        options: dioOptions,
        queryParameters: params,
      );
      final _orders = List<Order>.from(
        response.data['data'].map((x) => Order.fromJson(x)),
      );
      orders.add([..._orders]);
    } catch (e) {
      print(e);
    }
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

  Future<bool> createOrder(Order order) async {
    try {
      final response = await _dio.post(
        _endpoint,
        data: order.toJson(),
        options: dioOptions,
      );
      final success = (response.statusCode == 200) ? true : false;
      return success;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> additionalCharges(Order order) async {
    try {
      final endpoint = '$BASE_URL/notification/';
      final data = {
        'orderId': order.id,
        'missingBottlesQuantity': order.missingBottlesQuantity,
        'missingBoxQuantity': order.missingBoxQuantity,
        'missingBottlesPrice': '1.00',
        'missingBoxesPrice': '4.00',
      };
      final response = await _dio.post(
        endpoint,
        data: data,
        options: dioOptions,
      );
      final success = (response.statusCode == 200) ? true : false;
      return success;
    } catch (e) {
      print(e);
      return null;
    }
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

import 'dart:collection';
import 'dart:convert';

import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/services/order_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(jsonEncode(blueGrayMapTheme));
  }

  Set<Marker> setCustomerMarker() {
    Set<Marker> _customerMarker = HashSet<Marker>();
    final customerMarker = Marker(
      markerId: MarkerId('customerMarker'),
      position: _fullOrder.location.coordinates,
    );
    _customerMarker.add(customerMarker);
    return _customerMarker;
  }

  double calculateTotalPrice() {
    var _totalPrice = 0.00;
    _fullOrder.ordersDetail.forEach((detail) {
      _totalPrice += detail.totalPrice;
    });
    return _totalPrice;
  }

  void showPaymentMethodModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}

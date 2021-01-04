import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/services/order_service.dart';
import 'package:amadis_customer/services/payment_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stripe_payment/stripe_payment.dart';

class OrderDetailViewModel extends AmadisViewModel {
  OrderDetailViewModel(this.order);

  final Order order;
  final currency = 'PEN';

  final _orderService = injector<OrderService>();
  final _paymentService = injector<PaymentService>();

  String amount = '0.00';

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
    amount = (_totalPrice * 100).floor().toString();
    return _totalPrice;
  }

  void _newCardPayment() async {
    ExtendedNavigator.root.pop();
    print('requesting data');
    final paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    print('completed form');
    setLoading(true);
    await _paymentService.payWithNewCard(amount, currency, paymentMethod);
    setLoading(false);
  }

  void _nativePayment() async {
    ExtendedNavigator.root.pop();
    await _paymentService.nativePay(amount, currency);
  }

  void showPaymentMethodModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Image.asset(
                      AmadisAssets.credit_card,
                      scale: 1.5,
                    ),
                    title: Text(
                      'Tarjeta de Crédito',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () => _newCardPayment(),
                  ),
                  ListTile(
                    leading: Image.asset(
                      Platform.isAndroid
                          ? AmadisAssets.google
                          : AmadisAssets.ios,
                      scale: 1.5,
                    ),
                    title: Text(
                      Platform.isAndroid ? 'Google Pay' : 'Apple Pay',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () => _nativePayment(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

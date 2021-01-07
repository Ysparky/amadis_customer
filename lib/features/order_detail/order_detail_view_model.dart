import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/networking/api_response.dart';
import 'package:amadis_customer/services/order_service.dart';
import 'package:amadis_customer/services/payment_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stripe_payment/stripe_payment.dart';

class OrderDetailViewModel extends AmadisViewModel {
  OrderDetailViewModel(this.orderId) {
    orderService.getOrderById(orderId);
  }

  final int orderId;
  final currency = 'PEN';

  final orderService = injector<OrderService>();
  final _paymentService = injector<PaymentService>();

  double _totalPrice = 0.00;
  String get amount => (_totalPrice * 100).floor().toString();

  Stream<ApiResponse<Order>> get fullOrder => orderService.order;
  Order get order => orderService.order.value.data;

  void goBack() => ExtendedNavigator.root.pop();

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(jsonEncode(blueGrayMapTheme));
  }

  Set<Marker> setCustomerMarker() {
    Set<Marker> _customerMarker = HashSet<Marker>();
    final customerMarker = Marker(
      markerId: MarkerId('customerMarker'),
      position: order.location.coordinates,
    );
    _customerMarker.add(customerMarker);
    return _customerMarker;
  }

  double calculateTotalPrice() {
    order.ordersDetail.forEach((detail) {
      _totalPrice += detail.totalPrice;
    });
    return _totalPrice;
  }

  void _newCardPayment() async {
    ExtendedNavigator.root.pop();
    print('requesting data');
    try {
      final paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      );
      setLoading(true);
      await _paymentService.payWithNewCard(amount, currency, paymentMethod);
      await orderService.registerPayment(order.id, _totalPrice);
      setLoading(false);
      showMessageSnackBar(
        'El pago ha sido realizado correctamente',
        duration: const Duration(seconds: 2),
      );
      await Future.delayed(const Duration(seconds: 2)).then(
        (value) {
          ExtendedNavigator.root.popUntilRoot();
          ExtendedNavigator.root.popAndPush(
            Routes.dashboardPage,
            arguments:
                DashboardPageArguments(initialPage: 1, initialStateId: 8),
          );
        },
      );
    } catch (e) {
      print('Error en intento: ${e.toString()}');
      showErrorSnackBar(
        'El intento de pago ha sido cancelado',
        duration: const Duration(seconds: 1),
      );
    }
  }

  void _nativePayment() async {
    ExtendedNavigator.root.pop();
    await _paymentService.nativePay(amount, currency);
    showMessageSnackBar(
      'El pago ha sido realizado correctamente',
      duration: const Duration(seconds: 2),
    );
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        ExtendedNavigator.root.popUntilRoot();
        ExtendedNavigator.root.popAndPush(
          Routes.dashboardPage,
          arguments: DashboardPageArguments(initialPage: 1, initialStateId: 8),
        );
      },
    );
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
                    onTap: _newCardPayment,
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
                    onTap: _nativePayment,
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

import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/payment_intent_response.dart';
import 'package:dio/dio.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentService {
  PaymentService() {
    _init();
  }

  final String _url = 'https://api.stripe.com/v1/payment_intents';

  final _dio = Dio();

  void _init() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: STRIPE_PK,
        androidPayMode: 'test',
        merchantId: 'test',
      ),
    );
  }

  Future<void> payWithNewCard(
    String amount,
    String currency,
    PaymentMethod paymentMethod,
  ) async {
    final paymentResult = await _makePayment(amount, currency, paymentMethod);
    print(paymentResult.toJson());
  }

  Future nativePay(String amount, String currency) async {
    try {
      final newAmount = double.parse(amount) / 100;
      final token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: AndroidPayPaymentRequest(
          currencyCode: currency,
          totalPrice: amount,
        ),
        applePayOptions: ApplePayPaymentOptions(
          countryCode: 'US',
          currencyCode: currency,
          items: [
            ApplePayItem(label: 'Super producto 1', amount: '$newAmount')
          ],
        ),
      );

      final paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: CreditCard(token: token.tokenId)));

      final paymentResult = await _makePayment(amount, currency, paymentMethod);
      print(paymentResult.toJson());

      await StripePayment.completeNativePayRequest();
    } catch (e) {
      print('Error en intento: ${e.toString()}');
    }
  }

  Future<PaymentIntentResponse> _createPaymentIntent(
      String amount, String currency) async {
    try {
      final data = {'amount': amount, 'currency': currency};
      final headerOptions = Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {'Authorization': 'Bearer ${STRIPE_SK}'},
      );

      final response =
          await _dio.post(_url, data: data, options: headerOptions);

      return PaymentIntentResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<PaymentIntentResult> _makePayment(
    String amount,
    String currency,
    PaymentMethod method,
  ) async {
    try {
      final paymentIntent = await _createPaymentIntent(amount, currency);

      final paymentResult = await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          clientSecret: paymentIntent.clientSecret,
          paymentMethodId: method.id,
        ),
      );

      return paymentResult;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/services/payment_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentViewModel extends AmadisViewModel {
  PaymentViewModel();

  final paymentService = injector<PaymentService>();

  void newCardPayment(String amount, String currency) async {
    print('requesting data');
    final paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    print('completed form');
    setLoading(true);
    await paymentService.payWithNewCard(amount, currency, paymentMethod);
    setLoading(false);
  }

  void nativePayment(String amount, String currency) async {
    await paymentService.nativePay(amount, currency);
  }
}

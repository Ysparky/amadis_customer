import 'package:amadis_customer/features/dashboard/dashboard_page.dart';
import 'package:amadis_customer/features/login/login_page.dart';
import 'package:amadis_customer/features/order_detail/order_detail_page.dart';
import 'package:amadis_customer/features/payment/payment_method_page.dart';
import 'package:amadis_customer/features/sign_up/sign_up_page.dart';
import 'package:amadis_customer/features/welcome/welcome_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: [
    AdaptiveRoute(page: WelcomePage, initial: true),
    AdaptiveRoute(page: LoginPage),
    AdaptiveRoute(page: DashboardPage),
    AdaptiveRoute(page: SignUpPage),
    AdaptiveRoute(page: OrderDetailPage),
    AdaptiveRoute(page: PaymentMethodPage),
  ],
)
class $CustomRouter {}

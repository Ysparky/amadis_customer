import 'package:amadis_customer/features/dashboard/dashboard_page.dart';
import 'package:amadis_customer/features/login/login_page.dart';
import 'package:amadis_customer/features/sign_up/sign_up_page.dart';
import 'package:amadis_customer/features/welcome/welcome_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: [
    AdaptiveRoute(page: WelcomePage, initial: true),
    AdaptiveRoute(page: LoginPage),
    AdaptiveRoute(page: DashboardPage),
    AdaptiveRoute(page: SignUpPage),
  ],
)
class $CustomRouter {}

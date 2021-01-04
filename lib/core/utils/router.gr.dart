// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_page.dart';
import '../../features/login/login_page.dart';
import '../../features/order_detail/order_detail_page.dart';
import '../../features/sign_up/sign_up_page.dart';
import '../../features/welcome/welcome_page.dart';
import '../../models/models.dart';

class Routes {
  static const String welcomePage = '/';
  static const String loginPage = '/login-page';
  static const String dashboardPage = '/dashboard-page';
  static const String signUpPage = '/sign-up-page';
  static const String orderDetailPage = '/order-detail-page';
  static const all = <String>{
    welcomePage,
    loginPage,
    dashboardPage,
    signUpPage,
    orderDetailPage,
  };
}

class CustomRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.dashboardPage, page: DashboardPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.orderDetailPage, page: OrderDetailPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WelcomePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => WelcomePage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    DashboardPage: (data) {
      final args = data.getArgs<DashboardPageArguments>(
        orElse: () => DashboardPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => DashboardPage(
          key: args.key,
          initialPage: args.initialPage,
        ),
        settings: data,
      );
    },
    SignUpPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    OrderDetailPage: (data) {
      final args = data.getArgs<OrderDetailPageArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OrderDetailPage(
          key: args.key,
          order: args.order,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DashboardPage arguments holder class
class DashboardPageArguments {
  final Key key;
  final int initialPage;
  DashboardPageArguments({this.key, this.initialPage});
}

/// OrderDetailPage arguments holder class
class OrderDetailPageArguments {
  final Key key;
  final Order order;
  OrderDetailPageArguments({this.key, @required this.order});
}

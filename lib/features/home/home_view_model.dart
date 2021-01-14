import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:auto_route/auto_route.dart';

class HomeViewModel extends AmadisViewModel {
  HomeViewModel();

  final _prefs = SharedPrefs();

  String get fullName => _prefs.fullName;

  void logOut() {
    _prefs.removeAll();
    ExtendedNavigator.root.popAndPush(Routes.loginPage);
  }
}

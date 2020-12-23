import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:auto_route/auto_route.dart';

class ProfileViewModel extends AmadisViewModel {
  ProfileViewModel();
  final _prefs = SharedPrefs();

  void logOut() {
    _prefs.removeAll();
    ExtendedNavigator.root.popAndPush(Routes.loginPage);
  }
}

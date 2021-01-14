import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  SharedPreferences _preferences;

  void initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  int get customerId {
    return _preferences.getInt('customerId') ?? 0;
  }

  set customerId(int userId) {
    _preferences.setInt('customerId', userId);
  }

  bool get isLoggedIn {
    return _preferences.getBool('isLoggedIn') ?? false;
  }

  set isLoggedIn(bool isLogged) {
    _preferences.setBool('isLoggedIn', isLogged);
  }

  String get fullName {
    return _preferences.getString('fullName') ?? false;
  }

  set fullName(String fullName) {
    _preferences.setString('fullName', fullName);
  }

  void removeAll() {
    _preferences.remove('customerId');
    _preferences.remove('isLoggedIn');
  }
}

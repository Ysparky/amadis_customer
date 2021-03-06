import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:dio/dio.dart';

class AuthService {
  AuthService();

  final _dio = Dio();
  final _endpoint = '$BASE_URL/authenticate/login/';

  final _prefs = SharedPrefs();

  Future<User> requestLogin(String email, String password) async {
    try {
      final response = await _dio.post(_endpoint, options: dioOptions, data: {
        'email': '$email',
        'password': '$password',
      });
      if (response.statusCode == 200) {
        final userData = User.fromJson(response.data['data']);
        _prefs.isLoggedIn = true;
        _prefs.userId = userData.id;
        return userData;
      } else {
        print('USER NOT FOUND');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

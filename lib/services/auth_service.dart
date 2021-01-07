import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:dio/dio.dart';

class AuthService {
  AuthService();

  final _dio = Dio();
  final _endpoint = '$BASE_URL/authenticate/login/';

  final _prefs = SharedPrefs();

  Future<LoginResponse> requestLogin(String email, String password) async {
    try {
      final params = {'isCustomer': 1};
      final data = {'email': '$email', 'password': '$password'};
      final response = await _dio.post(
        _endpoint,
        queryParameters: params,
        data: data,
        options: dioOptions,
      );
      if (response.statusCode == 200) {
        final userData = LoginResponse.fromJson(response.data['data']);
        _prefs.isLoggedIn = true;
        _prefs.customerId = userData.customerId;
        print(response.data['data']);
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

  Future<bool> validateClientCode(
    String email,
    String password,
    String code,
  ) async {
    try {
      final _endpoint = '$BASE_URL/customers/$code/account';
      final data = {'email': '$email', 'password': '$password'};
      final response = await _dio.put(
        _endpoint,
        data: data,
        options: dioOptions,
      );
      return (response.statusCode == 200) ? true : false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

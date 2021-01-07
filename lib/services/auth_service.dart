import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:amadis_customer/networking/api_base_helper.dart';
import 'package:amadis_customer/networking/api_response.dart';
import 'package:dio/dio.dart';

class AuthService {
  AuthService();

  final _dio = Dio();
  final _helper = ApiBaseHelper();
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

  Future<ApiResponse> requestLogin2(String email, String password) async {
    final params = {'isCustomer': 1};
    final data = {'email': '$email', 'password': '$password'};

    return await _helper.post(
      '/authenticate/login/',
      params: params,
      body: data,
    );
  }

  Future<ApiResponse> validateClientCode(
    String email,
    String password,
    String code,
  ) async {
    final data = {'email': '$email', 'password': '$password'};
    return await _helper.put('/customers/$code/account', body: data);
  }
}

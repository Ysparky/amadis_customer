import 'package:amadis_customer/networking/api_base_helper.dart';
import 'package:amadis_customer/networking/api_response.dart';

class AuthService {
  AuthService();

  final _helper = ApiBaseHelper();

  Future<ApiResponse> requestLogin(String email, String password) async {
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

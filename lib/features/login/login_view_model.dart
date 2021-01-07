import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/services/auth_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class LoginPageViewModel extends AmadisViewModel {
  LoginPageViewModel();

  final _authService = injector<AuthService>();

  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final _loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginKey => _loginKey;

  void handleSignUp() => ExtendedNavigator.root.popAndPush(Routes.signUpPage);

  String emailValidator(String email) {
    final isValid = RegExp(emailRegex).hasMatch(email);
    if (email.isEmpty) {
      return 'El correo no puede estar vacío';
    } else if (!isValid) {
      return 'Asegúrese de haber ingresado un correo';
    } else {
      return null;
    }
  }

  String passwordValidator(String password) =>
      password.isEmpty ? 'La contraseña no puede estar vacía' : null;

  void login() async {
    var isFormValid = _loginKey.currentState.validate();
    if (isFormValid) {
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      setLoading(true);
      final user = await _authService.requestLogin(email, password);
      setLoading(false);
      await _handleLoginResponse(user);
    } else {
      showErrorSnackBar(
        '¡Verifique que no tenga errores!',
        duration: const Duration(milliseconds: 1500),
        elevation: 0,
        margin: EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
      );
    }
  }

  void _handleLoginResponse(dynamic user) async {
    if (user != null) {
      await ExtendedNavigator.root.popAndPush(Routes.dashboardPage);
    } else {
      showErrorSnackBar(
        'Correo y/o contraseña incorrectos',
        duration: const Duration(milliseconds: 1800),
        elevation: 0,
        margin: EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
      );
    }
  }
}

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

  String passwordValidator(String password) {
    return password.isEmpty ? 'La contraseña no puede estar vacía' : null;
  }

  void login() async {
    var isFormValid = _loginKey.currentState.validate();
    if (isFormValid) {
      setLoading(true);
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      final user = await _authService.requestLogin(email, password);
      setLoading(false);
      await _handleLoginResponse(user);
    } else {
      showErrorSnackBar('¡Verifique que no tenga errores!');
    }
  }

  void _handleLoginResponse(dynamic user) async {
    if (user != null) {
      await ExtendedNavigator.root.popAndPush(Routes.dashboardPage);
    } else {
      showErrorSnackBar('Correo y/o contraseña incorrectos');
    }
  }

  void handleSignUp() {
    ExtendedNavigator.root.push(Routes.signUpPage);
  }
}

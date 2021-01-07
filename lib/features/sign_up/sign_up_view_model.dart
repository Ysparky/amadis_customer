import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/services/auth_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends AmadisViewModel {
  SignUpViewModel();

  final authService = injector<AuthService>();

  final _emailcontroller = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');
  final _clientCodeController = TextEditingController(text: '');

  TextEditingController get emailController => _emailcontroller;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get clientCodeController => _clientCodeController;

  bool _visiblePassword = true;
  bool get visiblePassword => _visiblePassword;

  bool _check = false;
  bool get check => _check;

  final _signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> get signupKey => _signupKey;

  final _clientCodeKey = GlobalKey<FormState>();
  GlobalKey<FormState> get clientCodeKey => _clientCodeKey;

  final _pageController = PageController(initialPage: 0, keepPage: true);

  PageController get pageController => _pageController;

  void togglePassword() {
    _visiblePassword = !_visiblePassword;
    notifyListeners();
  }

  String emailValidator(String email) {
    final isValid = RegExp(emailRegex).hasMatch(email);
    if (email.isEmpty) {
      return 'El correo no puede estar vacío';
    } else if (!isValid) {
      return 'Asegúrese de haber ingresado un correo válido';
    } else {
      return null;
    }
  }

  String passwordValidator(String password) {
    return password.isEmpty ? 'La contraseña no puede estar vacía' : null;
  }

  String confirmpasswordValidator(String confirmPassword) {
    var password = _passwordController.text;

    return (confirmPassword == password)
        ? null
        : 'Contraseñas deben ser iguales';
  }

  void _validatePersonalInfo() {
    var isFormValid = _signupKey.currentState.validate();
    if (!isFormValid) {
      showErrorSnackBar(
        '¡Verifique que no tenga errores!',
        duration: const Duration(milliseconds: 1500),
        elevation: 0,
        margin: EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
      );
    } else if (!_check) {
      showErrorSnackBar(
        'Asegúrese de verificar los términos y condiciones',
        duration: const Duration(milliseconds: 1500),
        elevation: 0,
        margin: EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  String clientCodeValidator(String clientcode) {
    return (clientcode.isEmpty) ? 'Ingrese código de cliente' : null;
  }

  void _validateClientCode() async {
    var isFormValid = _clientCodeKey.currentState.validate();
    if (isFormValid) {
      setLoading(true);
      final success = await authService.validateClientCode(
        _emailcontroller.text,
        _passwordController.text,
        _clientCodeController.text,
      );
      setLoading(false);
      (success)
          ? ExtendedNavigator.root.pop()
          : showErrorSnackBar(
              '¡Verifique que tu código de cliente sea correcto!',
              duration: const Duration(milliseconds: 1500),
              elevation: 0,
              margin:
                  EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
            );
    } else {
      showErrorSnackBar(
        'Asegúrese de ingresar un código',
        duration: const Duration(milliseconds: 1500),
        elevation: 0,
        margin: EdgeInsets.only(bottom: hp(10), left: wp(2), right: wp(2)),
      );
    }
  }

  void toggleCheckbox(bool value) {
    _check = value;
    notifyListeners();
  }

  void handleFirstButton() {
    var _page = pageController.page;
    if (_page == 0) {
      ExtendedNavigator.root.popAndPush(Routes.loginPage);
    } else if (_page == 1) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void handleSecondButton() {
    var _page = pageController.page;
    if (_page == 0.0) {
      _validatePersonalInfo();
    } else if (_page == 1.0) {
      _validateClientCode();
    }
  }

  final _dialogController = ScrollController();

  void showTermsAndConditionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Términos y Condiciones'),
          content: Theme(
            data: ThemeData.light().copyWith(
              highlightColor: AmadisColors.primaryColor,
            ),
            child: Scrollbar(
              controller: _dialogController,
              thickness: 2.5,
              radius: Radius.circular(15.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: _dialogController,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: wp(1.5)),
                  child: Text(
                    TERMS_AND_CONDITIONS,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                _check = false;
                notifyListeners();
                ExtendedNavigator.root.pop();
              },
            ),
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                _check = true;
                notifyListeners();
                ExtendedNavigator.root.pop();
              },
            ),
          ],
        );
      },
    );
  }
}

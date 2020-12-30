import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/services/auth_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel extends AmadisViewModel {
  final authService = injector<AuthService>();

  final _emailcontroller = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _confirmPasswordController = TextEditingController(text: '');
  final _clientCodeController = TextEditingController(text: '');

  TextEditingController get emailController => _emailcontroller;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  TextEditingController get clientCodeController => _clientCodeController;

  bool _visiblePassword = true;
  bool get visiblePassword => _visiblePassword;

  final _signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> get signupKey => _signupKey;

  final _clientCodeKey = GlobalKey<FormState>();
  GlobalKey<FormState> get clientCodeKey => _clientCodeKey;


  final _pageController = PageController(
    initialPage: 0,
    keepPage: true
  );

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

  String confirmpasswordValidator(String confirmPassword){
    var password = _passwordController.text;

    return (confirmPassword == password) ? null : 'Contraseñas deben ser iguales';
  }

  void validatePersonalInfo(){
    var isFormValid = _signupKey.currentState.validate();
    if(isFormValid){
      _pageController.jumpToPage(1);
    }else{
      showErrorSnackBar('¡Verifique que no tenga errores!');
    }
  }
  String clientCodeValidator(String clientcode){
    return (clientcode.isEmpty) ? 'Ingrese código de cliente':  null;
  }

  void validateClientCode()async{
    var isFormValid = _clientCodeKey.currentState.validate();
    if(isFormValid){
      setLoading(true);
      final success = await authService.validateClientCode(_emailcontroller.text, _passwordController.text, _clientCodeController.text);
      setLoading(false);
      (success) ? ExtendedNavigator.root.pop() : showErrorSnackBar('¡Verifique que tu código de cliente sea correcto!');
    }else{
      showErrorSnackBar('¡Verifique que no tenga errores!');
    }
  }
}

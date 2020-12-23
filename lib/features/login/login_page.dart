import 'package:amadis_customer/core/utils/loading_overlay.dart';
import 'package:amadis_customer/core/utils/responsive.dart';
import 'package:amadis_customer/features/login/login_view_model.dart';
import 'package:amadis_customer/features/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPageViewModel()),
      ],
      child: LoadingOverlay<LoginPageViewModel>(
        child: LoginPageBase(),
      ),
    );
  }
}

class LoginPageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _node = FocusScope.of(context);
    final _viewModel = Provider.of<LoginPageViewModel>(context);
    return Scaffold(
      key: _viewModel.scaffoldKey,
      extendBody: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: hp(100)),
          child: IntrinsicHeight(
            child: GestureDetector(
              onTap: () => _node.unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderSide(),
                  SizedBox(height: hp(8)),
                  Padding(
                    padding: EdgeInsets.only(left: wp(10)),
                    child: Text(
                      'Iniciar Sesión',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(height: hp(10)),
                  Expanded(
                    child: Form(
                      key: _viewModel.loginKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: wp(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: _viewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                              onEditingComplete: () => _node.nextFocus(),
                              textInputAction: TextInputAction.next,
                              validator: _viewModel.emailValidator,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: 'Correo Electrónico',
                                isDense: true,
                                icon: Icon(Icons.person_outline),
                              ),
                            ),
                            TextFormField(
                              controller: _viewModel.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onFieldSubmitted: (_) => _viewModel.login(),
                              validator: _viewModel.passwordValidator,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                hintText: 'Contraseña',
                                isDense: true,
                                icon: Icon(Icons.lock_outline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  BottomButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

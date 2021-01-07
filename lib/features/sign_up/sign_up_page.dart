import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignUpViewModel(),
        ),
      ],
      child: LoadingOverlay<SignUpViewModel>(child: SignUpPageBase()),
    );
  }
}

class SignUpPageBase extends StatelessWidget {
  const SignUpPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<SignUpViewModel>(context);
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _viewModel.scaffoldKey,
      backgroundColor: AmadisColors.primaryColor,
      appBar: CustomAppBar(headerTitle: 'Registrarse'),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        child: Container(
          color: AmadisColors.backgroundColor,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _viewModel.pageController,
            children: [
              PersonalInfo(totalHeight: hp(93) - statusBarHeight),
              _miCuenta(context, _viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _miCuenta(BuildContext context, SignUpViewModel viewModel) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      child: Form(
        key: viewModel.clientCodeKey,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: hp(100) - hp(7) - statusBarHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        Divider(height: 30.0),
                        _crearCDC(viewModel),
                        Divider(height: 30.0),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  BottomButtons(
                    firstText2: 'Regresar',
                    secondText: 'Validar',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearCDC(SignUpViewModel viewModel) {
    return FieldColumn(
      inputText: 'Código de cliente',
      textFormField: TextFormField(
        controller: viewModel.clientCodeController,
        validator: viewModel.clientCodeValidator,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Código de Cliente',
        ),
        inputFormatters: [
          UpperCaseTextFormatter(),
        ],
      ),
    );
  }
}

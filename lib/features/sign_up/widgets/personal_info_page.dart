import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/custom_form_field.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({
    Key key,
    @required this.totalHeight,
  }) : super(key: key);

  final double totalHeight;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);
    final _node = FocusScope.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => _node.unfocus(),
        child: Form(
          key: viewModel.signupKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: totalHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: wp(7),
                        vertical: hp(2.5),
                      ),
                      child: Column(
                        children: [
                          FieldColumn(
                            inputText: 'Correo Electrónico',
                            customFormField: CustomFormField(
                              hintText: 'Correo Electrónico',
                              onEditingComplete: () => _node.nextFocus(),
                              suffixIcon: Icon(Icons.email),
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              textController: viewModel.emailController,
                              validator: viewModel.emailValidator,
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          FieldColumn(
                            inputText: 'Contraseña',
                            customFormField: CustomFormField(
                              hintText: 'Contraseña',
                              obscureText: viewModel.visiblePassword,
                              onEditingComplete: () => _node.nextFocus(),
                              textInputAction: TextInputAction.next,
                              textController: viewModel.passwordController,
                              validator: viewModel.passwordValidator,
                              suffixIcon: IconButton(
                                icon: (viewModel.visiblePassword)
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: viewModel.togglePassword,
                              ),
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          FieldColumn(
                            inputText: 'Confirmar Contraseña',
                            customFormField: CustomFormField(
                              hintText: 'Confirmar Contraseña',
                              obscureText: viewModel.visiblePassword,
                              onEditingComplete: () => _node.unfocus(),
                              textController:
                                  viewModel.confirmPasswordController,
                              validator: viewModel.confirmpasswordValidator,
                              suffixIcon: IconButton(
                                icon: (viewModel.visiblePassword)
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: viewModel.togglePassword,
                              ),
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          TermsAndConditionsRow(viewModel: viewModel),
                        ],
                      ),
                    ),
                    Spacer(flex: 1),
                    BottomButtons(
                      firstText: '¿Ya tienes cuenta?',
                      firstText2: 'Inicia Sesión',
                      secondText: 'Siguiente   ￫',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: viewModel.check,
          onChanged: viewModel.toggleCheckbox,
          activeColor: AmadisColors.primaryColor,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.black),
              child: RichText(
                text: TextSpan(
                  text: 'Aceptar los',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Términos y Condiciones',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = viewModel.showTermsAndConditionDialog,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

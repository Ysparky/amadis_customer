import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/bottom_buttons.dart';
import 'package:amadis_customer/features/sign_up/widgets/field_column.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    Key key,
    @required this.totalHeight,
  }) : super(key: key);

  final double totalHeight;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      body: Container(
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
                      padding: EdgeInsets.symmetric(horizontal: wp(7)),
                      child: Column(
                        children: [
                          SizedBox(height: hp(2.5)),
                          FieldColumn(
                            inputText: 'Correo Electrónico',
                            textFormField: TextFormField(
                              validator: viewModel.emailValidator,
                              keyboardType: TextInputType.emailAddress,
                              controller: viewModel.emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: 'Correo Electrónico',
                              ),
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          FieldColumn(
                            inputText: 'Contraseña',
                            textFormField: TextFormField(
                              validator: viewModel.passwordValidator,
                              obscureText: viewModel.visiblePassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: (viewModel.visiblePassword)
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    onPressed: () {
                                      viewModel.togglePassword();
                                    }),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: 'Contraseña',
                              ),
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          FieldColumn(
                            inputText: 'Confirmar Contraseña',
                            textFormField: TextFormField(
                              validator: viewModel.confirmpasswordValidator,
                              obscureText: viewModel.visiblePassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: viewModel.confirmPasswordController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: (viewModel.visiblePassword)
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off),
                                    onPressed: () {
                                      viewModel.togglePassword();
                                    }),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                hintText: 'Confirmar Contraseña',
                              ),
                            ),
                          ),
                          SizedBox(height: hp(2.5)),
                          Row(
                            children: [
                              Checkbox(
                                value: viewModel.check,
                                onChanged: viewModel.toggleCheckbox,
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
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' Términos y Condiciones',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) => CustomDialog(
                                                    title:
                                                        'Términos y condiciones',
                                                    description:
                                                        'La normativa legal exige que el usuario tenga conocimiento de las condiciones de '
                                                        'contratación de un producto o servicio, por lo que una redacción incompleta o inadecuada'
                                                        'puede dar a lugar a la imposición de una sanción por parte de un ente público.\n\n'
                                                        'Su importancia también radica en la confianza que genera en los...',
                                                  ),
                                                );
                                              },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Stack dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

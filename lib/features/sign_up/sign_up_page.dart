import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';

import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/bottom_buttons.dart';
import 'package:amadis_customer/features/sign_up/widgets/signup_button.dart';
import 'package:amadis_customer/features/sign_up/widgets/uppercase_textformatter.dart';
import 'package:amadis_customer/features/sign_up/widgets/xd.dart';
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
    return Scaffold(
      key: _viewModel.scaffoldKey,
      backgroundColor: AmadisColors.primaryColor,
      appBar: CustomAppBar(
        headerTitle: 'Registrarse',
        headerActions: [IconButton(icon: Icon(Icons.details), onPressed: null)],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _viewModel.pageController,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              child: Container(
                height: hp(100),
                width: wp(100),
                color: Color(0xffF6F6F6),
                child: _infoPersonal(context, _viewModel),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              child: Container(
                height: hp(100),
                width: wp(100),
                color: Color(0xffF6F6F6),
                child: _miCuenta(context, _viewModel),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              child: Container(
                height: hp(100),
                width: wp(100),
                color: Color(0xffF6F6F6),
                child: _terminos(context, _viewModel),
              ),
            ),
          ),
        ],
      ),
      //_body()
    );
  }

  Widget _infoPersonal(BuildContext context, SignUpViewModel viewModel) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      child: Form(
        key: viewModel.signupKey,
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
                        SizedBox(
                          height: 30.0,
                        ),
                        _crearEmail(viewModel),
                        Divider(
                          height: 30.0,
                        ),
                        _crearContrasena(viewModel),
                        Divider(
                          height: 30.0,
                        ),
                        _crearContrasena2(viewModel),
                        // Divider(
                        //   height: 30.0,
                        // ),
                        // _crearBotonPersonalInfo(viewModel),
                        Divider(
                          height: 30.0,
                        ),
                        _crearTerminos(context, viewModel),
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

      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _miCuenta(BuildContext context, SignUpViewModel viewModel) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      child: Form(
        key: viewModel.signupKey,
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
                        Divider(
                          height: 30.0,
                        ),
                        _crearCDC(viewModel),
                        Divider(
                          height: 30.0,
                        ),
                        // _crearBotonClientCode(viewModel),
                        // Divider(
                        //   height: 30.0,
                        // ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  BottomButtons(
                    //firstText: '',
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

    // Container(
    //   child: Form(
    //     key: viewModel.clientCodeKey,
    //     child: ListView(
    //       children: [

    //       ],
    //     ),
    //   ),
    //   padding: EdgeInsets.symmetric(horizontal: 30.0),
    //   // margin: EdgeInsets.only(top: 130.0),
    // );
  }

  Widget _terminos(BuildContext context, SignUpViewModel viewModel) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          //_barraPaginacion(),
          SizedBox(
            height: 20.0,
          ),
          _crearTerminos(context, viewModel),
          Divider(
            height: 30.0,
          ),
          _crearBotonTerms(viewModel),
          Divider(
            height: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _crearContrasena(SignUpViewModel viewModel) {
    return XD(
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Contraseña'),
      ),
    );
  }

  Widget _crearContrasena2(SignUpViewModel viewModel) {
    return XD(
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
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Confirmar Contraseña'),
      ),
    );
  }

  Widget _crearEmail(SignUpViewModel viewModel) {
    return XD(
      inputText: 'Correo Electrónico',
      textFormField: TextFormField(
        validator: viewModel.emailValidator,
        keyboardType: TextInputType.emailAddress,
        controller: viewModel.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Correo Electrónico',
        ),
      ),
    );
  }

  Widget _crearBotonPersonalInfo(SignUpViewModel viewModel) {
    return SignUpButton(
      text: 'SIGUIENTE',
      onPressed: viewModel.validatePersonalInfo,
    );
  }

  Widget _crearBotonClientCode(SignUpViewModel viewModel) {
    return SignUpButton(
      text: 'VALIDAR',
      onPressed: viewModel.validateClientCode,
    );
  }

  Widget _crearBotonTerms(SignUpViewModel viewModel) {
    return SignUpButton(
      text: 'FINALIZAR',
      onPressed: viewModel.validatePersonalInfo,
    );
  }

  Widget _crearCDC(SignUpViewModel viewModel) {
    return XD(
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

  Widget _crearTerminos(BuildContext context, SignUpViewModel viewModel) {
    return Column(
      children: [
        Row(children: [
          Checkbox(value: viewModel.check, onChanged: viewModel.toggleCheckbox),
          Expanded(
              child: TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => CustomDialog(
                        title: 'Términos y condiciones',
                        description:
                            'La normativa legal exige que el usuario tenga conocimiento de las condiciones de '
                            'contratación de un producto o servicio, por lo que una redacción incompleta o inadecuada'
                            'puede dar a lugar a la imposición de una sanción por parte de un ente público.\n\n'
                            'Su importancia también radica en la confianza que genera en los...',
                        //description2: 'hola',
                      ));
            },
            child: Text(
              'Aceptar términos y condiciones',
              style: TextStyle(fontSize: 15,decoration: TextDecoration.underline, ),
              ///Theme.of(context).textTheme.bodyText2,
            ),
            autofocus: true,
          ))
        ]),
      ],
    );
  }

  Widget alert() {
    return AlertDialog(
      title: Text('Hola'),
      content: Text('Hola de nuevo'),
      actions: [
        FlatButton(onPressed: () {}, child: Text('Si')),
        FlatButton(onPressed: () {}, child: Text('No')),
      ],
    );
  }

  Widget _barraPaginacion() {
    // final pageViewIndex= Provider.of<SliderModel>(context).currentPage;
    return Container(
      child: CustomPaint(
        painter: MiPaint1(),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.005,
            ),
            Column(
              children: [
                Container(
                  child: CircleAvatar(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        //backgroundColor: _pageController.currentPage() ? AmadisColors.primaryColor:Colors.white,
                        //backgroundColor: (pageViewController.page==pageViewIndex.currentPage) ? AmadisColors.primaryColor : Colors.white,
                        backgroundColor: AmadisColors.primaryColor,
                        radius: 10,
                      ),
                      backgroundColor: Colors.white,
                      radius: 17,
                    ),
                    radius: 20,
                    backgroundColor: AmadisColors.primaryColor,
                  ),
                ),
                Text('INFORMACIÓN'),
                Text('PERSONAL'),
              ],
            ),
            SizedBox(
              width: size.width * 0.005,
            ),
            Column(
              children: [
                Container(
                  child: CircleAvatar(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        //backgroundColor: _pageController.currentPage() ? AmadisColors.primaryColor:Colors.white,
                        backgroundColor: Colors.white,
                        radius: 10,
                      ),
                      backgroundColor: Colors.white,
                      radius: 17,
                    ),
                    radius: 20,
                    backgroundColor: AmadisColors.primaryColor,
                  ),
                ),
                Text('MI CUENTA'),
                Text(''),
              ],
            ),
            SizedBox(
              width: size.width * 0.005,
            ),
            Column(
              children: [
                Container(
                  child: CircleAvatar(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        //backgroundColor: _pageController.currentPage() ? AmadisColors.primaryColor:Colors.white,
                        backgroundColor: Colors.white,
                        radius: 10,
                      ),
                      backgroundColor: Colors.white,
                      radius: 17,
                    ),
                    radius: 20,
                    backgroundColor: AmadisColors.primaryColor,
                  ),
                ),
                Text('TÉRMINOS Y'),
                Text('CONDICIONES'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MiPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AmadisColors.primaryColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke; //la linea
    final path = Path();
    path.moveTo(size.width * 0.18, size.height * 0.3);
    path.lineTo(size.width * 0.45, size.height * 0.3);
    path.lineTo(size.width * 0.735, size.height * 0.3);
    //path.lineTo(size.width * 0.5, 0);
    // path.moveTo(5, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MiPaint1 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MiPaint1 oldDelegate) => false;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key key, this.title, this.description, this.description2, this.image})
      : super(key: key);
  final String title, description, description2;
  final Image image;

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

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(
            top: 16,
          ),
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
              SizedBox(
                height: 24,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16.0),
              ),
              //SizedBox(  height: 24,),
              //Text(description2,style: TextStyle(fontSize: 16.0),),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Confirmar',
                      style: TextStyle(
                          //decoration: ,
                          fontSize: 17,
                          //backgroundColor: Colors.brown,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    )),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: 0,
        //   left: 16,
        //   right: 16,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.white,
        //     radius: 50,
        //   ),
        //   ),
      ],
    );
  }
}

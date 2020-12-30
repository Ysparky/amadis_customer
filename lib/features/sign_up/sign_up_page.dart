import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/signup_button.dart';
import 'package:amadis_customer/features/sign_up/widgets/slider_model.dart';
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
                child: _infoPersonal(_viewModel),
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
                child: _miCuenta(_viewModel),
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

  Widget _infoPersonal(SignUpViewModel viewModel) {
    return Container(
      child: Form(
        key: viewModel.signupKey,
        child: ListView(
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
            Divider(
              height: 30.0,
            ),
            _crearBotonPersonalInfo(viewModel),
            Divider(
              height: 30.0,
            ),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _miCuenta(SignUpViewModel viewModel) {
    return Container(
      child: Form(
        key: viewModel.clientCodeKey,
        child: ListView(
          children: [
            Divider(
              height: 30.0,
            ),
            _crearCDC(viewModel),
            Divider(
              height: 30.0,
            ),
            _crearBotonClientCode(viewModel),
            Divider(
              height: 30.0,
            ),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
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
          _crearTerminos(context),
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

  Widget _crearTerminos(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Términos y condiciones',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  'La normativa legal exige que el usuario tenga conocimiento de las condiciones de '
                  'contratación de un producto o servicio, por lo que una redacción incompleta o inadecuada'
                  'puede dar a lugar a la imposición de una sanción por parte de un ente público.\n',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Su importancia también radica en la confianza que genera en los...',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.justify,
                ),
                //SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
        Row(children: [
          Checkbox(value: false, onChanged: (_) {}),
          Expanded(
              child: Text(
            'Aceptar términos y condiciones',
            style: Theme.of(context).textTheme.bodyText2,
          ))
        ]),
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

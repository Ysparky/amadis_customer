import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/sign_up/widgets/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/colors.dart';
// import '../../core/utils/colors.dart';
// import '../../core/utils/colors.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/colors.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/responsive.dart';
// import '../../core/utils/responsive.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _nombre = '';
  String _apellido = '';
  String _correo = '';
  String _telefono = '';
  String _cDC = '';

  final pageViewController = PageController();
  // PageController pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print('Pagina Actual: ${pageViewController.page}');
      //actualizar el provider, sliderModel, en conclusion, usamos el setter del SliderModel
      //Provider.of<SliderModel>(context, listen: false).currentPage =  pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        // backgroundColor: AmadisColors.backgroundColor,
        backgroundColor: AmadisColors.primaryColor,
        appBar: CustomAppBar(
          headerTitle: 'Registrarse',
          headerActions: [
            IconButton(icon: Icon(Icons.details), onPressed: null)
          ],
        ),
        body: PageView(
          controller: pageViewController,
          children: [
            Container(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.0)),
                child: Container(
                  height: hp(100),
                  width: wp(100),
                  color: Color(0xffF6F6F6),
                  child: _infoPersonal(context),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.0)),
                child: Container(
                  height: hp(100),
                  width: wp(100),
                  color: Color(0xffF6F6F6),
                  child: _miCuenta(context),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.0)),
                child: Container(
                  height: hp(100),
                  width: wp(100),
                  color: Color(0xffF6F6F6),
                  child: _terminos(context),
                ),
              ),
            ),
          ],
        ),
        //_body()
      ),
    );
  }

  Widget _infoPersonal(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 30.0,
          ),
          _barraPaginacion(Provider.of<SliderModel>(context)),
          SizedBox(
            height: 20.0,
          ),
          _crearNombre(),
          Divider(
            height: 30.0,
          ),
          _crearApellido(),
          Divider(
            height: 30.0,
          ),
          _crearEmail(),
          Divider(
            height: 30.0,
          ),
          _crearTelefono(),
          Divider(
            height: 30.0,
          ),
          _crearBoton(),
          Divider(
            height: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _miCuenta(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          _barraPaginacion(Provider.of<SliderModel>(context)),
          SizedBox(
            height: 20.0,
          ),
          _crearCDC(),
          Divider(
            height: 30.0,
          ),
          _crearBoton(),
          Divider(
            height: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _terminos(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 20.0,
          ),
          _barraPaginacion(Provider.of<SliderModel>(context)),
          SizedBox(
            height: 20.0,
          ),
          _crearTerminos(),
          Divider(
            height: 30.0,
          ),
          _crearBoton(),
          Divider(
            height: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      // margin: EdgeInsets.only(top: 130.0),
    );
  }

  Widget _crearTelefono() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Número de Teléfono',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Número de Teléfono',
            // labelText: 'Nombre',
          ),
          onChanged: (valor) {
            setState(() {
              _telefono = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Correo Electrónico',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Correo Electrónico',
            // labelText: 'Correo',
          ),
          onChanged: (valor) {
            setState(() {
              _correo = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearNombre() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Nombre',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Nombre',
            // labelText: 'Nombre',
          ),
          onChanged: (valor) {
            setState(() {
              _nombre = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearApellido() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Apellido',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Apellido',
            // labelText: 'Nombre',
          ),
          onChanged: (valor) {
            setState(() {
              _apellido = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('SIGUIENTE'),
        ),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: AmadisColors.primaryColor,
        textColor: Colors.white,
        onPressed: () {
          // pageViewController = PageController();.nextPage(
          //     duration: Duration(microseconds: 400), curve: Curves.easeIn);
        }
        // () {
        //    Navigator.pushNamed(context, '');
        // }
        );
  }

  Widget _crearCDC() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Código de Cliente',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 7,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Código de Cliente',
            // labelText: 'Nombre',
          ),
          onChanged: (valor) {
            setState(() {
              _cDC = valor;
            });
          },
        ),
      ],
    );
  }

  Widget _crearTerminos() {
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

  // Widget _barraPaginacion() {
  //   return Column(children: [
  //     Row(children: [
  //       Container(
  //         child: CircleAvatar(
  //           backgroundColor: Colors.red,
  //         ),
  //       ),
  //     ]),
  //     Row(children: [
  //       Expanded(child: Text('INFORMACION PERSONAL')),
  //       Text('MI CUENTA'),
  //       Expanded(child: Text('TÉRMINOS Y CONDICIONES')),
  //     ]),
  //     SizedBox(
  //       height: 10.0,
  //     )
  //   ]);
  // }

  Widget _barraPaginacion(SliderModel pageViewIndex) {
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
                        backgroundColor: (pageViewController.page==pageViewIndex.currentPage) ? AmadisColors.primaryColor : Colors.white,
                        //backgroundColor: AmadisColors.primaryColor,
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

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// class _Circulos extends StatelessWidget {
//   final int totalSlides;
//   _Circulos(
//     this.totalSlides,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 70,
//       // color: Colors.red,
//       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//         _Circulo(0),
//         _Circulo(1),
//         _Circulo(2),
//       ]),
//     );
//   }
// }

// class _Circulo extends StatelessWidget {
//   final int index;

//   _Circulo(this.index);

//   @override
//   Widget build(BuildContext context) {
//     final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
//     return Container(
//       width: 12,
//       height: 12,
//       margin: EdgeInsets.symmetric(horizontal: 5.0),
//       decoration: BoxDecoration(
//         color:
//             (pageViewIndex == index) ? AmadisColors.primaryColor : Colors.white,
//         shape: BoxShape.circle,
//       ),
//     );

//     //  CircleAvatar(
//     //  backgroundColor: (pageViewIndex==index) ? AmadisColors.primaryColor : Colors.white,
//     //  radius: 10,
//     // );
//   }
// }

// // class _Slides extends StatefulWidget {
// //   final List<Widget> slides;

// //   const _Slides(this.slides);

// //   @override
// //   __SlidesState createState() => __SlidesState();
// // }

// // class __SlidesState extends State<_Slides> {
// //   final pageViewController = PageController();
// //   @override
// //   void initState() {
// //     super.initState();
// //     pageViewController.addListener(() {
// //       print('Pagina Actual: ${pageViewController.page}');
// //       //actualizar el provider, sliderModel
// //       //Provider.of<_SlideshowModel>(context, listen: false).currentPage=pageViewController.page;
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     pageViewController.dispose(); //para prevenir fugas de memoria
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       child: PageView(
// //         controller: pageViewController,
// //         children: widget.slides.map((slide) => _Slide(slide)).toList(),
// //       ),
// //     );
// //   }
// // }

// // class _Slide extends StatelessWidget {
// //   final Widget slide;

// //   const _Slide(this.slide);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       height: double.infinity,
// //       padding: EdgeInsets.all(30),
// //       child: slide,
// //     );
// //   }
// // }

// // class _SlideshowModel with ChangeNotifier {
// //   double _currentPage = 0;
// //   Color _colorPrimario = Colors.blue;
// //   Color _colorSecundario = Colors.grey;
// //   double _bulletPrimario = 12.0;
// //   double _bulletSecundario = 12.0;

// //   //obtenemos el valor de la propiedad
// //   double get currentPage => this._currentPage;

// //   set currentPage(double pagina) {
// //     this._currentPage = pagina;
// //     print(pagina);
// //     notifyListeners();
// //   }

// //   Color get colorPrimario => this._colorPrimario;
// //   set colorPrimario(Color color) {
// //     this._colorPrimario = color;
// //     // notifyListeners();
// //   }

// //   Color get colorSecundario => this._colorSecundario;
// //   set colorSecundario(Color color) {
// //     this._colorSecundario = color;
// //     // notifyListeners();
// //   }

// //   double get bulletPrimario => this._bulletPrimario;
// //   set bulletPrimario(double size) {
// //     this._bulletPrimario = size;
// //     // notifyListeners();
// //   }

// //   double get bulletSecundario => this._bulletSecundario;
// //   set bulletSecundario(double size) {
// //     this._bulletSecundario = size;
// //     // notifyListeners();
// //   }
// }
//////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

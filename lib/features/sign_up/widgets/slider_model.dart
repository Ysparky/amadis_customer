import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{
  double _currentPage=0;

  //obtenemos el valor de la propiedad
  double get currentPage => _currentPage;

  set currentPage(double pagina){
    _currentPage=pagina;
    //print(pagina);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

import 'package:amadis_customer/core/utils/utils.dart';

class AmadisViewModel extends ChangeNotifier {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool newValue) {
    _isLoading = newValue;
    if (hasListeners) {
      notifyListeners();
    }
  }

  void showMessageSnackBar(
    String message, {
    SnackBarAction action,
    Duration duration,
  }) {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          duration: duration ?? Duration(seconds: 5),
          content: Text(message),
          backgroundColor: AmadisColors.secondaryColor,
          action: action,
        ),
      );
    }
  }

  void showErrorSnackBar(
    String message, {
    SnackBarAction action,
    Duration duration,
    EdgeInsetsGeometry margin,
    double elevation = 6.0,
  }) {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          action: action,
          backgroundColor: AmadisColors.errorColor,
          behavior: SnackBarBehavior.floating,
          content: Text(message),
          duration: duration ?? Duration(seconds: 3),
          elevation: elevation,
          margin: margin ?? EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
        ),
      );
    }
  }
}

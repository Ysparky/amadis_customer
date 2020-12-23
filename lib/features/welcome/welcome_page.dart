import 'package:amadis_customer/core/utils/router.gr.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _prefs = SharedPrefs();
    return FutureBuilder(
      future: injector.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? WillPopScope(
                onWillPop: () => Future.value(false),
                child: SplashScreen(
                  loaderColor: AmadisColors.primaryColor,
                  image: Image.asset(AmadisAssets.logo),
                  photoSize: wp(40),
                  navigateAfterSeconds: _prefs.isLoggedIn
                      ? Routes.dashboardPage
                      : Routes.loginPage,
                  seconds: 2,
                ),
              )
            : Container(
                color: Colors.blue,
              );
      },
    );
  }
}

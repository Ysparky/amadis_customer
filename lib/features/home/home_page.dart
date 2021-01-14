import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: LoadingOverlay<HomeViewModel>(child: HomePageBase()),
    );
  }
}

class HomePageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: AmadisColors.backgroundColor,
      appBar: CustomAppBar(
        headerTitle: 'Hola, ${_viewModel.fullName}',
        headerActions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _viewModel.logOut,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: wp(10),
          vertical: hp(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AmadisAssets.building_app,
              height: hp(40),
            ),
            SizedBox(height: hp(3)),
            Text(
              'EN DESARROLLO',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: hp(3)),
            MaterialButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Cerrar Sesión'),
              ),
              color: AmadisColors.secondaryColor,
              onPressed: _viewModel.logOut,
              shape: StadiumBorder(),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

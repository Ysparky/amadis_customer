import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<LoginPageViewModel>(context);
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            onPressed: _viewModel.handleSignUp,
            height: hp(9),
            minWidth: double.infinity,
            shape: ContinuousRectangleBorder(
              side: BorderSide(color: Colors.indigo[50]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aún no tienes cuenta',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: hp(0.8)),
                Text(
                  'Regístrate',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: _viewModel.login,
            child: Text(
              'Ingresar   ￫',
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            height: hp(9),
            shape: ContinuousRectangleBorder(),
            color: AmadisColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

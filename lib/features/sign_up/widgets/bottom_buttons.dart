import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/login/login_view_model.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
    this.firstText,
    this.secondText,
    this.firstText2,
  }) : super(key: key);

  final String firstText;
  final String firstText2;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<SignUpViewModel>(context);
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            onPressed: _viewModel.handleFirstButton,
            height: hp(9),
            minWidth: double.infinity,
            shape: ContinuousRectangleBorder(
                side: BorderSide(
              color: Colors.indigo[50],
            )),
            child: (firstText != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstText,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: hp(0.8)),
                      Text(
                        firstText2,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Text(
                    firstText2,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: _viewModel.validatePersonalInfo,
            child: Text(
              secondText,
              // 'Siguiente   ￫',
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

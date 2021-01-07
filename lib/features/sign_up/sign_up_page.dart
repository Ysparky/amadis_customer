import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/sign_up/sign_up_view_model.dart';
import 'package:amadis_customer/features/sign_up/widgets/widgets.dart';
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
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      key: _viewModel.scaffoldKey,
      backgroundColor: AmadisColors.primaryColor,
      appBar: CustomAppBar(headerTitle: 'Registrarse'),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        child: Container(
          color: AmadisColors.backgroundColor,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _viewModel.pageController,
            children: [
              PersonalInfoPage(totalHeight: hp(93) - statusBarHeight),
              ClientCodePage(totalHeight: hp(93) - statusBarHeight),
            ],
          ),
        ),
      ),
    );
  }
}

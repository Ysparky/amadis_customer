import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: LoadingOverlay<ProfileViewModel>(
        child: ProfilePageBase(),
      ),
    );
  }
}

class ProfilePageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      key: _viewModel.scaffoldKey,
      backgroundColor: AmadisColors.backgroundColor,
      appBar: CustomAppBar(
        headerTitle: 'Perfil',
        headerActions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _viewModel.logOut,
          )
        ],
      ),
    );
  }
}

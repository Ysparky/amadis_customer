import 'package:amadis_customer/core/utils/loading_overlay.dart';
import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/core/widgets/widgets.dart';
import 'package:amadis_customer/features/payment/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentViewModel()),
      ],
      child: LoadingOverlay<PaymentViewModel>(
        child: PaymentMethodPageBase(),
      ),
    );
  }
}

class PaymentMethodPageBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<PaymentViewModel>(context);
    return Scaffold(
      key: _viewModel.scaffoldKey,
      backgroundColor: AmadisColors.primaryColor,
      appBar: CustomAppBar(headerTitle: 'Método de Pago'),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        child: Ink(
          height: hp(100),
          width: wp(100),
          padding: EdgeInsets.symmetric(vertical: hp(5), horizontal: wp(2.5)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
            color: AmadisColors.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Seleccione un método de pago:',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: hp(2)),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        AmadisAssets.credit_card,
                        scale: 1.5,
                      ),
                      title: Text(
                        'Tarjeta de Crédito',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Image.asset(
                        AmadisAssets.google,
                        scale: 1.5,
                      ),
                      title: Text(
                        'Google Pay',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Image.asset(
                        AmadisAssets.ios,
                        scale: 1.5,
                      ),
                      title: Text(
                        'Apple Pay',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

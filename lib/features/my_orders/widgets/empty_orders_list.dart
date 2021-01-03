import 'package:flutter/material.dart';

import 'package:amadis_customer/core/utils/assets.dart';
import 'package:amadis_customer/core/utils/colors.dart';
import 'package:amadis_customer/core/utils/responsive.dart';

class EmptyOrdersList extends StatelessWidget {
  const EmptyOrdersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AmadisAssets.emptyBox,
                fit: BoxFit.cover,
                color: AmadisColors.primaryColor,
                height: hp(20),
              ),
              SizedBox(height: hp(2)),
              Text(
                'LISTA VACÍA',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'No hay pedidos encontrados',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
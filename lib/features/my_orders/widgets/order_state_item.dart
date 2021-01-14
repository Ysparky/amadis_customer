import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/my_orders/my_orders_view_model.dart';
import 'package:amadis_customer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderStateItem extends StatelessWidget {
  const OrderStateItem({
    Key key,
    @required this.state,
  }) : super(key: key);

  final OrderState state;

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<MyOrdersViewModel>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: hp(1),
        horizontal: wp(2),
      ),
      decoration: BoxDecoration(
        color: state.selected ? AmadisColors.primaryColor : Colors.white,
        border: Border.all(
          color: !state.selected ? AmadisColors.primaryColor : Colors.white,
        ),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(60.0),
          right: Radius.circular(60.0),
        ),
      ),
      child: MaterialButton(
        onPressed: () => _viewModel.handleTap(state),
        shape: StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(0.5)),
          child: Center(
            child: Text(
              state.id != 5 ? '${state.name}s' : state.name,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: !state.selected
                      ? AmadisColors.primaryColor
                      : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

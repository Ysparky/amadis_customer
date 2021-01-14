import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:amadis_customer/features/order_detail/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<OrderDetailViewModel>(context);
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          height: hp(30),
          width: wp(100),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                _viewModel.order?.location?.coordinates?.latitude,
                _viewModel.order?.location?.coordinates?.longitude,
              ),
              zoom: 15,
            ),
            onMapCreated: _viewModel.onMapCreated,
            markers: _viewModel.setCustomerMarker(),
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          height: hp(75),
          width: wp(100),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Container(
                color: AmadisColors.backgroundColor,
                padding:
                    EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
                child: Column(
                  children: [
                    OrderDataCard(order: _viewModel.order),
                    // SizedBox(height: hp(1)),
                    // CustomerDataCard(),
                    SizedBox(height: hp(1)),
                    OrderDetailCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (_viewModel.order.orderStateId == 7)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: hp(8),
            child: Container(
              decoration: BoxDecoration(
                color: AmadisColors.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -hp(0.2)),
                    blurRadius: 2.0,
                    color: Colors.black12,
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: wp(5)),
              child: Row(
                children: [
                  Text(
                    'Total :',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: wp(2)),
                  Text(
                    ' S/. ${_viewModel.calculateTotalPrice().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: _viewModel.showPaymentMethodModal,
                    shape: StadiumBorder(),
                    color: AmadisColors.secondaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(8),
                      vertical: hp(1.5),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Pagar',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(width: wp(2)),
                        Icon(
                          Icons.credit_card,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

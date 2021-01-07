import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/order_detail/order_detail_view_model.dart';
import 'package:amadis_customer/features/order_detail/widgets/widgets.dart';
import 'package:amadis_customer/models/order.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    Key key,
    @required this.order,
  }) : super(key: key);
  final Order order;
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
                order?.location?.coordinates?.latitude,
                order?.location?.coordinates?.longitude,
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
              physics: BouncingScrollPhysics(),
              child: Container(
                color: AmadisColors.backgroundColor,
                padding:
                    EdgeInsets.symmetric(horizontal: wp(5), vertical: hp(2)),
                child: Column(
                  children: [
                    OrderDataCard(order: order),
                    SizedBox(height: hp(2)),
                    CustomerDataCard(),
                    SizedBox(height: hp(2)),
                    OrderDetailCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

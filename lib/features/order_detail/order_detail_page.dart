import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:amadis_customer/features/order_detail/widgets/widgets.dart';
import 'package:amadis_customer/services/order_service.dart';
import 'package:amadis_customer/models/order.dart';
import 'package:amadis_customer/core/utils/blue_gray_map_theme.dart';
import 'package:amadis_customer/utils/responsive.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key key}) : super(key: key);

  // GoogleMapController _mapController;

  Set<Marker> _setCustomerMarker(LatLng coordinates) {
    Set<Marker> _customerMarker = HashSet<Marker>();
    final customerMarker = Marker(
      markerId: MarkerId('customerMarker'),
      position: coordinates,
    );
    _customerMarker.add(customerMarker);
    return _customerMarker;
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(jsonEncode(blueGrayMapTheme));
  }

  @override
  Widget build(BuildContext context) {
    final _orderService = OrderService();
    final Order _order = ModalRoute.of(context).settings.arguments;
    return FutureBuilder(
      future: _orderService.getOrderById(_order.id),
      builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
        if (snapshot.hasData) {
          final order = snapshot.data;
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Color(0xffF6F6F6),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFloatingButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CustomFloatingButton(
                    icon: Icon(Icons.near_me_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, 'loading', arguments: order);
                    },
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  height: hp(30),
                  width: wp(100),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        order.location.coordinates.latitude,
                        order.location.coordinates.longitude,
                      ),
                      zoom: 15,
                    ),
                    onMapCreated: _onMapCreated,
                    markers: _setCustomerMarker(order.location.coordinates),
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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40.0)),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        color: Color(0xffF6F6F6),
                        padding: EdgeInsets.symmetric(
                            horizontal: wp(5), vertical: hp(2)),
                        child: Column(
                          children: [
                            OrderDataCard(order: order),
                            SizedBox(height: hp(2)),
                            CustomerDataCard(order: order),
                            SizedBox(height: hp(2)),
                            OrderDetailCard(order: order),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

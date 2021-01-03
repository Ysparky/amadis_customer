import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:animate_do/animate_do.dart';

import 'package:amadis_customer/models/order.dart';
import 'package:amadis_customer/utils/constants.dart';
import 'package:amadis_customer/utils/responsive.dart';

class CustomerDataCard extends StatelessWidget {
  const CustomerDataCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  void _makePhoneCall(String contactNumber) async {
    final phone = '+51 $contactNumber';
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Datos del cliente',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: hp(1)),
                  Text(order.customer),
                  Text(order.contactNumber),
                ],
              ),
            ),
            ElasticIn(
              delay: Duration(milliseconds: 400),
              child: IconButton(
                onPressed: () async => _makePhoneCall(order.contactNumber),
                icon: Icon(Icons.call, color: kPrimaryColor, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

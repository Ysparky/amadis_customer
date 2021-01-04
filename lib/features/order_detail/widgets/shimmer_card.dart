import 'package:amadis_customer/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: hp(10),
        width: wp(100),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container(color: Colors.white)),
                SizedBox(height: hp(1)),
                Expanded(child: Container(color: Colors.white)),
                SizedBox(height: hp(1)),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

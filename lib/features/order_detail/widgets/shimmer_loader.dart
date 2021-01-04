import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/order_detail/widgets/shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          height: hp(30),
          width: wp(100),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.white,
            child: Container(color: Colors.white),
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
                    Column(
                      children: [
                        const ShimmerCard(),
                        SizedBox(height: hp(2)),
                        const ShimmerCard(),
                        SizedBox(height: hp(2)),
                        const ShimmerCard(),
                      ],
                    ),
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

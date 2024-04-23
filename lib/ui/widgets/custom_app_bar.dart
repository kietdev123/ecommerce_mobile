import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_mobile/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../res/resources.dart';

final List<String> imgList = [
  'https://img.freepik.com/free-photo/elegant-young-woman-with-brown-wavy-hair-red-lips-eyeliner-dark-dress-jacket-stylish-black-accessories-walking-street-summer-autumn-looking-straight_197531-28155.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/premium-photo/tall-stylish-girl-with-oversized-jacket-posing-near-railing-steps-city-background_227201-1136.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/premium-photo/model-fashion-urban-street-outfit-trendy-cap-military-coat_161568-13094.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/free-photo/young-handsome-man-by-university_1303-10039.jpg?ga=GA1.1.793473770.1713229781&semt=ais',
];

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomAppBarDelegate({required this.title});
  final String title;

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final double animationVal = scrollAnimationValue(shrinkOffset);
    final resource = Resources(context);

    return Container(
      height: visibleMainHeight,
      padding: EdgeInsets.fromLTRB(
          resource.dimension.bigMargin, 0, resource.dimension.bigMargin, 0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBackButton(),
              Text(
                title,
                style: resource.style.appbarTitleStyle,
              ),
              Icon(Ionicons.search)
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

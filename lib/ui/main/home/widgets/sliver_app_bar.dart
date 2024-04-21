import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_mobile/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import '../../../../res/resources.dart';

final List<String> imgList = [
  'https://img.freepik.com/free-photo/elegant-young-woman-with-brown-wavy-hair-red-lips-eyeliner-dark-dress-jacket-stylish-black-accessories-walking-street-summer-autumn-looking-straight_197531-28155.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/premium-photo/tall-stylish-girl-with-oversized-jacket-posing-near-railing-steps-city-background_227201-1136.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/premium-photo/model-fashion-urban-street-outfit-trendy-cap-military-coat_161568-13094.jpg?size=626&ext=jpg&ga=GA1.1.793473770.1713229781&semt=sph',
  'https://img.freepik.com/free-photo/young-handsome-man-by-university_1303-10039.jpg?ga=GA1.1.793473770.1713229781&semt=ais',
];

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
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
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Container(
          //   color: Colors.blue,
          // ),

          Opacity(
            opacity: (1 - animationVal),
            child: Stack(
              children: [
                Image.network(
                  height: visibleMainHeight,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  "https://thumbs.dreamstime.com/b/fashion-pretty-cool-youngwith-shopping-bags-wearing-black-hat-white-pants-over-colorful-orange-background-79063329.jpg?w=768",
                ),
                Positioned(
                    bottom: 8,
                    left: 24,
                    child: Column(
                      children: [
                        Text(
                          'Street clothes',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          // Opacity(
          //     opacity: animationVal,
          //     child: Image.network(
          //       "https://thumbs.dreamstime.com/b/fashion-female-model-fashionable-clothes-posing-street-portrait-beautiful-sexy-woman-stylish-fall-spring-clothing-79059440.jpg?w=768",
          //       fit: BoxFit.cover,
          //     )),
          Opacity(
            opacity: animationVal,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: visibleMainHeight,
                    // aspectRatio: 16 / 9,
                    // viewportFraction: 0.8,
                    // aspectRatio: 2.0,
                    // enlargeCenterPage: true,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    // autoPlayCurve: Curves.fastOutSlowIn,
                    // enlargeCenterPage: true,
                    enlargeFactor: 1,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                  ),
                  items: imgList
                      .map((item) => Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            )),
                          ))
                      .toList(),
                ),
                Positioned(
                  bottom: 36,
                  left: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white),
                      ),
                      Text(
                        'sale',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: 100,
                        child: SubmitButton(
                            type: SubmitButtonType.banner,
                            content: 'Check',
                            event: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   bottom: 0.0,
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       children: <Widget>[
          //         Expanded(
          //           flex: (animationVal * 100).toInt(),
          //           child: Container(),
          //         ),
          //         Text(
          //           "Lorem Ipsum Dolar Sit",
          //           style: TextStyle(color: Colors.white),
          //         ),
          //         Expanded(
          //           flex: 100,
          //           child: Container(),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

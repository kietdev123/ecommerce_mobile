import 'dart:math';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/main/shop/search_result/widgets/select_sort_sheet.dart';
import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class SearchResultAppBarDelegate extends SliverPersistentHeaderDelegate {
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
          Container(
            padding: EdgeInsets.only(
                top: 12,
                left: resource.dimension.bigMargin,
                right: resource.dimension.bigMargin),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Opacity(
                      opacity: (1 - animationVal),
                      child: Text("Women's tops",
                          style: resource.style.appbarTitleStyle),
                    ),
                    Icon(Icons.search),
                  ],
                ),
                const SizedBox(height: 16),
                if (animationVal == 1) ...[
                  const SizedBox(height: 16),
                  Text("Women's tops", style: resource.style.headingTextStyle),
                ],
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: Container(
                        width: double.infinity,
                        height: 35,
                        child: ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.only(left: (index == 0) ? 24 : 8),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text('Asdsdsdsdsdsds',
                                    style: resource.style.whiteTextSmallStyle),
                              ),
                            );
                          },
                        ),
                      )),
                ),
                const SizedBox(height: 16),
                Container(
                    color: Colors.grey.withOpacity(0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Ionicons.filter_outline),
                            Text('Filter'),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return const SelectSortSheet();
                                });
                          },
                          child: Row(
                            children: [
                              Icon(Ionicons.swap_vertical_outline),
                              Text('Price: lowest to high'),
                            ],
                          ),
                        ),
                        Icon(Icons.menu),
                      ],
                    ))
              ],
            ),
          ),

          // )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 210.0;

  @override
  double get minExtent => 150.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

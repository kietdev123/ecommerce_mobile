import 'package:ecommerce_mobile/res/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SortProductType {
  popular,
  newest,
  customer_review,
  price_increase,
  price_decrease,
}

Map<SortProductType, String> sortProductTypeMap = {
  SortProductType.popular: 'Popular',
  SortProductType.newest: 'Newest',
  SortProductType.customer_review: 'Customer review',
  SortProductType.price_increase: 'Price: lowest to high',
  SortProductType.price_decrease: 'Price: highest to low',
};

class SelectSortSheet extends StatelessWidget {
  const SelectSortSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = SortProductType.price_decrease;
    final resource = Resources(context);
    Widget normalRow(SortProductType type) {
      return Container(
        // height: 50,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(sortProductTypeMap[type].toString()),
          ),
        ),
      );
    }

    Widget selectedRow(SortProductType type) {
      return Container(
        // height: 50,
        color: resource.color.colorPrimary,
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              sortProductTypeMap[type].toString(),
              style: resource.style.whiteTextSmallStyle,
            ),
          ),
        ),
      );
    }

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Container(
        height: 250,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Text('Sort by', style: resource.style.appbarTitleStyle),
            ),
            Expanded(child: Container()),
            for (var value in SortProductType.values) ...[
              (selected != value) ? normalRow(value) : selectedRow(value),
            ],
            // ElevatedButton(
            //   child: const Text(
            //       'Close BottomSheet'),
            //   onPressed: () =>
            //       Navigator.pop(context),
            // ),
          ],
        ),
      ),
    );
  }
}

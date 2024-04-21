import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/categories_item.dart';
import 'package:flutter/material.dart';

import '../../../../../res/resources.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key, required this.titles});
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(height: 16),
        for (var i = 0; i < titles.length; i++)
          Container(
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), //
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  titles[i],
                  style: resource.style.textDefaulThin,
                ),
              ),
            ),
          )
      ],
    );
  }
}

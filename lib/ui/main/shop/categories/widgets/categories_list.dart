import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/categories_item.dart';
import 'package:flutter/material.dart';

import '../../../../../res/resources.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList(
      {super.key, required this.imgUrls, required this.titles});
  final List<String> titles;
  final List<String> imgUrls;

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            resource.dimension.bigMargin, 0, resource.dimension.bigMargin, 0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              height: 150,
              width: size.width,
              decoration: BoxDecoration(
                color: resource.color.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), //
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SUMMER SALES',
                      style: resource.style.whiteTextStyle,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Up to 50% off',
                      style: resource.style.whiteTextSmallStyle,
                    ),
                  ]),
            ),
            const SizedBox(height: 16),
            for (var i = 0; i < titles.length; i++)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: CategoriesItem(title: titles[i], imgUrl: imgUrls[i]),
              )
          ],
        ),
      ),
    );
  }
}

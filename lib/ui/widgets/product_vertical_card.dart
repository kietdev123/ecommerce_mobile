import 'package:ecommerce_mobile/data/models/product.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProductVerticalCard extends StatelessWidget {
  const ProductVerticalCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final recouse = Resources(context);
    final saleLabel = Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: recouse.color.colorPrimary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        '-${product.saleNumber}%',
        style: recouse.style.whiteTextVerySmallStyle,
      ),
    );
    final newLabel = Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: recouse.color.colorPrimaryText,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'NEW',
        style: recouse.style.whiteTextVerySmallStyle,
      ),
    );
    final isNew = (product.saleNumber!.toDouble() <= 50) ? true : false;
    return Container(
      width: 130,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    height: 130,
                    width: 130,
                    // height: 0,
                    // height: 200,
                    // height: 150,
                    fit: BoxFit.cover,
                    product.imgUrls![0].toString()),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  for (var i = 0; i < product.star!.toInt(); i++)
                    const Icon(size: 12, Ionicons.star, color: Colors.amber),
                  for (var i = 0; i < 5 - product.star!.toInt(); i++)
                    const Icon(size: 12, Ionicons.star, color: Colors.grey),
                  Text(
                    '(${product.star.toString()})',
                    style: recouse.style.subHeadingTextSmallStyle,
                  ),
                ],
              ),
              Text(
                product.productDisplayName.toString(),
                overflow: TextOverflow.ellipsis,
                style: recouse.style.subHeadingTextSmallStyle,
                maxLines: 2,
              ),
              Text(
                '${product.usage} ${product.subCategory}',
                style: recouse.style.headingTextSmallStyle,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isNew) ...[
                    Text(
                      formatPrice(product.price!.toDouble()),
                      style:
                          recouse.style.subHeadingTextSmallStyleWithLineThrough,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      formatPrice(product.price!.toDouble() -
                          product.price!.toDouble() *
                              product.saleNumber!.toDouble() /
                              100),
                      style: recouse.style.textPrimarySmall,
                    ),
                  ],
                  if (isNew)
                    Text(
                      formatPrice(product.price!.toDouble()),
                    ),
                ],
              ),
            ],
          ),
          Positioned(top: 8, left: 8, child: isNew ? newLabel : saleLabel),
          Positioned(
              top: 110,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  Ionicons.heart_outline,
                  size: 12,
                ),
              )),
        ],
      ),
    );
  }
}

import 'package:ecommerce_mobile/data/models/product.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final recouse = Resources(context);
    final size = MediaQuery.of(context).size;

    final saleLabel = Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: recouse.color.colorPrimary.withOpacity(0.7),
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
        color: recouse.color.colorPrimaryText.withOpacity(0.7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'NEW',
        style: recouse.style.whiteTextVerySmallStyle,
      ),
    );
    final isNew = (product.saleNumber!.toDouble() <= 50) ? true : false;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: 150,
          child: OverflowBox(
            maxWidth: size.width,
            child: Container(
              width: size.width,
              margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8),
                        bottomStart: Radius.circular(8)),
                    child: Image.network(
                        height: 130,
                        width: 130,
                        // height: 0,
                        // height: 200,
                        // height: 150,
                        fit: BoxFit.cover,
                        product.imgUrls![0].toString()),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${product.usage} ${product.subCategory}',
                        style: recouse.style.headingTextSmallStyle,
                      ),
                      Text(
                        product.productDisplayName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: recouse.style.subHeadingTextSmallStyle,
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < product.star!.toInt(); i++)
                            const Icon(
                                size: 12, Ionicons.star, color: Colors.amber),
                          for (var i = 0; i < 5 - product.star!.toInt(); i++)
                            const Icon(
                                size: 12, Ionicons.star, color: Colors.grey),
                          Text(
                            '(${product.star.toString()})',
                            style: recouse.style.subHeadingTextSmallStyle,
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!isNew) ...[
                            Text(
                              formatPrice(product.price!.toDouble()),
                              style: recouse.style
                                  .subHeadingTextSmallStyleWithLineThrough,
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
                ],
              ),
            ),
          ),
        ),
        Positioned(top: 24, left: 16, child: isNew ? newLabel : saleLabel),
        Positioned(
            top: 120,
            right: 15,
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
    );
  }
}

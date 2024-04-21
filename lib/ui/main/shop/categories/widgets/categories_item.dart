import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../res/resources.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.title, required this.imgUrl});
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(width: 6),
        Text(
          title,
          style: resource.style.headingTextSmallStyle,
        ),
        ClipRRect(
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(12), bottomEnd: Radius.circular(12)),
          child: Image.network(
            imgUrl,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}

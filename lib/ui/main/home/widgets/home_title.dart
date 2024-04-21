import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../res/resources.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.eventViewAll});
  final String title;
  final String subTitle;
  final Function eventViewAll;

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    return Container(
      // width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: resource.style.headingTextStyle,
            ),
            Text(
              subTitle,
              style: resource.style.subHeadingTextStyle,
            ),
          ]),
          GestureDetector(
              onTap: () {
                eventViewAll;
              },
              child: Text('View all'))
        ],
      ),
    );
  }
}

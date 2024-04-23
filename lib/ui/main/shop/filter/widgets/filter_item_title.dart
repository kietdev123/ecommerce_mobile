import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterItemTitle extends StatelessWidget {
  const FilterItemTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: Text(title),
    );
  }
}

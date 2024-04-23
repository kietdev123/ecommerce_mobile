import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterItemCard extends StatelessWidget {
  const FilterItemCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: child,
      ),
    );
  }
}

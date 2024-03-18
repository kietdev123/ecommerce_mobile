import 'package:flutter/material.dart';
import '../../res/resources.dart';

class PaddingScreen extends StatelessWidget {
  Widget child;
  PaddingScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final paddingScreen = resource.paddingScreen();
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingScreen, 0, paddingScreen, 0),
      child: child,
    );
  }
}

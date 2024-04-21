import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

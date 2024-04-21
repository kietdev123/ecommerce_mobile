import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../res/resources.dart';

enum SubmitButtonType {
  form,
  banner,
}

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.type,
      required this.content,
      required this.event});
  final SubmitButtonType type;
  final String content;
  final Function event;

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    var _style = TextStyle();
    var _size = const Size(double.infinity, 46);
    if (type == SubmitButtonType.form) {
      _style = resource.style.whiteTextStyle;
      _size = const Size(double.infinity, 46);
    }
    if (type == SubmitButtonType.banner) {
      _style = resource.style.whiteTextStyle;
      _size = const Size(100, 32);
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: resource.color.colorPrimary,
        minimumSize: _size,
        maximumSize: _size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        event;
      },
      child: Text(content, style: _style),
    );
  }
}

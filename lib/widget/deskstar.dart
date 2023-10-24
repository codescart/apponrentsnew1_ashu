import 'package:flutter/material.dart';
import 'package:testt/widget/sizes_helpers.dart';

class deskstar extends StatelessWidget {
  final int value;
  const deskstar({Key  , this.value = 0})
      : assert(value != null);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border, size: displayWidth(context)* 0.015,
        );
      }),
    );
  }

}
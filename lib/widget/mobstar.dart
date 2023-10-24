import 'package:flutter/material.dart';
import 'package:testt/widget/sizes_helpers.dart';

class mobstar extends StatelessWidget {
  final int value;
  const mobstar({Key  , this.value = 0})
      : assert(value != null);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(1, (index) {
        return Icon(
          index < value ? Icons.thumb_up : Icons.thumb_up, size: displayWidth(context)* 0.06,
        );
      }),
    );
  }

}
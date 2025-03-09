import 'package:flutter/material.dart';

import '../../extensions/key_extension.dart';
import '../semantics/semantics.dart';

class FCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double? value;

  const FCircularProgressIndicator({
    double? strokeWidth,
    super.key,
    this.color,
    this.backgroundColor,
    this.valueColor,
    this.value,
  }) : strokeWidth = strokeWidth ?? 4.0;

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
        value: value,
      ),
    );
  }
}

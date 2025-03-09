import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FWrap extends StatelessWidget {
  final List<Widget> children;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;
  final Axis direction;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final TextDirection? textDirection;
  final Clip clipBehavior;
  final VerticalDirection verticalDirection;

  const FWrap({
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.textDirection,
    this.runSpacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.direction = Axis.horizontal,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.alignment = WrapAlignment.start,
    this.children = const <Widget>[],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Wrap(
        alignment: alignment,
        crossAxisAlignment: crossAxisAlignment,
        direction: direction,
        spacing: spacing,
        runAlignment: runAlignment,
        runSpacing: runSpacing,
        textDirection: textDirection,
        clipBehavior: clipBehavior,
        verticalDirection: verticalDirection,
        children: children,
      ),
    );
  }
}

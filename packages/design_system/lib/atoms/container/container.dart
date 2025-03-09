import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  const FContainer({
    super.key,
    this.height,
    this.width,
    this.color,
    this.constraints,
    this.decoration,
    this.alignment,
    this.padding,
    this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Container(
        height: height,
        width: width,
        color: color,
        constraints: constraints,
        decoration: decoration,
        alignment: alignment,
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}

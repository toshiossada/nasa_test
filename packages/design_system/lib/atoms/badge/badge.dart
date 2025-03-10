import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FBadge extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final double? smallSize;
  final double? largeSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Offset? offset;
  final Widget? label;
  final bool isLabelVisible;
  final Widget? child;
  final String? tooltip;

  const FBadge({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.smallSize,
    this.largeSize,
    this.textStyle,
    this.padding,
    this.alignment,
    this.offset,
    this.label,
    this.isLabelVisible = true,
    this.child,
    this.tooltip,
  });
  FBadge.count({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.smallSize,
    this.largeSize,
    this.textStyle,
    this.padding,
    this.alignment,
    this.offset,
    required int count,
    this.isLabelVisible = true,
    this.child,
    this.tooltip,
  }) : label = Text(count > 999 ? '999+' : '$count');

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      label: tooltip,
      excludeSemantics: true,
      child: Badge(
        backgroundColor: backgroundColor,
        textColor: textColor,
        smallSize: smallSize,
        largeSize: largeSize,
        textStyle: textStyle,
        padding: padding,
        alignment: alignment,
        offset: offset,
        isLabelVisible: isLabelVisible,
        label: label,
        child: child,
      ),
    );
  }
}

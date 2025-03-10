import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FIconButton extends StatelessWidget {
  final Widget icon;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double? iconSize;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final String? tooltip;
  final bool? enableFeedback;
  final BoxConstraints? constraints;
  final VisualDensity? visualDensity;
  final bool autofocus;
  final double? splashRadius;
  final FocusNode? focusNode;
  final MouseCursor? mouseCursor;
  final bool? isSelected;
  final Widget? selectedIcon;
  final ButtonStyle? style;

  const FIconButton({
    required this.icon,
    super.key,
    this.autofocus = false,
    this.alignment,
    this.padding,
    this.onPressed,
    this.iconSize,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.tooltip,
    this.enableFeedback,
    this.constraints,
    this.visualDensity,
    this.splashRadius,
    this.focusNode,
    this.mouseCursor,
    this.isSelected,
    this.selectedIcon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      button: true,
      value: tooltip,
      child: IconButton(
        icon: icon,
        alignment: alignment,
        padding: padding,
        onPressed: onPressed,
        iconSize: iconSize,
        color: color,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        disabledColor: disabledColor,
        enableFeedback: enableFeedback,
        constraints: constraints,
        visualDensity: visualDensity,
        autofocus: autofocus,
        splashRadius: splashRadius,
        focusNode: focusNode,
        mouseCursor: mouseCursor,
        isSelected: isSelected,
        selectedIcon: selectedIcon,
        style: style,
      ),
    );
  }
}

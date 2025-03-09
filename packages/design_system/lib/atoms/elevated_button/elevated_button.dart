import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FElevatedButton extends StatelessWidget {
  const FElevatedButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior,
    required this.child,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: key?.keyValue,
      label: tooltip,
      container: true,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        child: child,
      ),
    );
  }
}

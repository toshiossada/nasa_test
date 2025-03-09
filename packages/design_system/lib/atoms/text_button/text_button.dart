import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const FTextButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      button: true,
      excludeSemantics: true,
      child: TextButton(onPressed: onPressed, style: style, child: child),
    );
  }
}

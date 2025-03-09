import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FVisibility extends StatelessWidget {
  final Widget child;
  final Widget replacement;
  final bool visible;

  const FVisibility({
    required this.child,
    super.key,
    this.visible = true,
    Widget? replacement,
  }) : replacement = replacement ?? const FSizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Visibility(
        replacement: replacement,
        visible: visible,
        child: child,
      ),
    );
  }
}

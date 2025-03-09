import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FPadding extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;

  const FPadding({required this.padding, super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Padding(padding: padding, child: child),
    );
  }
}

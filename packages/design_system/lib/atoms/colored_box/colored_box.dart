import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FColoredBox extends StatelessWidget {
  final Widget? child;
  final Color color;
  const FColoredBox({required this.color, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: ColoredBox(color: color, child: child),
    );
  }
}

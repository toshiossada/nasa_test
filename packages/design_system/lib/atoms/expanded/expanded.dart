import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FExpanded extends StatelessWidget {
  final Widget child;
  final int flex;

  const FExpanded({required this.child, super.key, int? flex})
    : flex = flex ?? 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FSemantics(identifier: super.key?.keyValue, child: child),
    );
  }
}

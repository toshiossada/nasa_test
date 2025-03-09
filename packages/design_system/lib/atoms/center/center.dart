import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FCenter extends StatelessWidget {
  final Widget child;

  const FCenter({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Center(child: child),
    );
  }
}

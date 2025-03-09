import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FAlign extends StatelessWidget {
  final Widget? child;
  final AlignmentGeometry alignment;
  final double? widthFactor;
  final double? heightFactor;

  const FAlign({
    super.key,
    this.child,
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Align(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: child,
      ),
    );
  }
}

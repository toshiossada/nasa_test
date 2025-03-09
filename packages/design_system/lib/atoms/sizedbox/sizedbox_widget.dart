import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FSizedBox extends StatelessWidget {
  const FSizedBox({super.key, this.width, this.height, this.child});

  const FSizedBox.shrink({super.key})
    : width = null,
      height = null,
      child = null;

  const FSizedBox.expand({super.key, this.child})
    : width = double.infinity,
      height = double.infinity;

  const FSizedBox.square({required double dimension, super.key, this.child})
    : width = dimension,
      height = dimension;

  FSizedBox.fromSize({super.key, this.child, Size? size})
    : width = size?.width,
      height = size?.height;

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: SizedBox(width: width, height: height, child: child),
    );
  }
}

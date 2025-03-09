import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final Axis scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const FSingleChildScrollView({
    required this.child,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: SingleChildScrollView(
        controller: controller,
        physics: physics,
        padding: padding,
        scrollDirection: scrollDirection,
        child: child,
      ),
    );
  }
}

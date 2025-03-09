import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;

  const FIcon({required this.icon, super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      excludeSemantics: true,
      child: Icon(icon, color: color),
    );
  }
}

import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final String? tooltip;

  const FIcon({required this.icon, super.key, this.color, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      label: tooltip,
      excludeSemantics: true,
      child: Icon(icon, color: color),
    );
  }
}

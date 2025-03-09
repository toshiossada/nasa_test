import 'package:flutter/material.dart';

class FSpacer extends StatelessWidget {
  final int flex;

  const FSpacer({
    super.key,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Spacer(
      flex: flex,
    );
  }
}

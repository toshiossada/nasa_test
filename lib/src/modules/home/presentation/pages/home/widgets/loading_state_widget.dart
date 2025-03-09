import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const FCenter(child: FCircularProgressIndicator());
  }
}

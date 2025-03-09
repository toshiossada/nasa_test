import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

import '../../../../../core/errors.dart';

class FailureStateWidget extends StatelessWidget {
  const FailureStateWidget({
    required this.failure,
    required this.retry,
    super.key,
  });
  final Failure failure;
  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return FColumn(
      children: [
        const FCenter(child: FIcon(icon: Icons.error)),
        FText('Ocorreu um erro: ${failure.message}'),
        FElevatedButton(
          onPressed: retry,
          child: const FText('Tentar Novamente'),
        ),
      ],
    );
  }
}

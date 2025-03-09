import 'package:design_system/atoms.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/apod_entity.dart';
import 'media_display_widget.dart';

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({required this.apod, super.key});

  final ApodEntity apod;

  @override
  Widget build(BuildContext context) {
    return FColumn(
      children: [
        FCenter(
          child: FText(
            key: const Key('Title'), //
            apod.title,
          ),
        ),
        FText(
          key: const Key('Description'), //
          apod.explanation,
        ),
        MediaDisplayWidget(
          key: const Key('MediaOfDay'),
          mediaType: apod.mediaType,
          url: apod.hdUrl,
        ),
      ],
    );
  }
}

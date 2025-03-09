import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FText extends StatelessWidget {
  const FText(
    this.text, {
    this.textStyle,
    super.key,
    this.semanticLabel,
    this.textAlign,
    this.textOverflow,
    this.textDirection,
    this.maxLines,
    this.softWrap = true,
    this.textDecoration,
  });

  final String text;
  final String? semanticLabel;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextStyle? textStyle;
  final bool softWrap;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: semanticLabel ?? key?.keyValue,
      value: text,
      container: true,
      child: Text(
        text,
        style: textStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: textOverflow,
        textDirection: textDirection,
        softWrap: softWrap,
      ),
    );
  }
}

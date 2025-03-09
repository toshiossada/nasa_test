import 'package:flutter/material.dart';

class FSemantics extends StatelessWidget {
  final Widget? child;
  final String? label;
  final bool container;
  final bool? enabled;
  final bool? image;
  final bool? textField;
  final bool? button;
  final String? value;
  final String? identifier;
  final bool excludeSemantics;

  const FSemantics({
    super.key,
    this.child,
    this.label,
    this.container = false,
    this.enabled,
    this.image,
    this.textField,
    this.button,
    this.value,
    this.identifier,
    this.excludeSemantics = false,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      identifier: identifier,
      button: button,
      container: container,
      enabled: enabled,
      image: image,
      textField: textField,
      value: value,
      excludeSemantics: excludeSemantics,
      child: child,
    );
  }
}

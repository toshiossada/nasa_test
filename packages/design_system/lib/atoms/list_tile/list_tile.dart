import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FListTile extends StatelessWidget {
  final Widget? leading;

  final Widget? title;

  final Widget? subtitle;

  final Widget? trailing;

  final bool isThreeLine;

  final bool? dense;

  final VisualDensity? visualDensity;

  final ShapeBorder? shape;

  final Color? selectedColor;

  final Color? iconColor;

  final Color? textColor;

  final TextStyle? titleTextStyle;

  final TextStyle? subtitleTextStyle;

  final TextStyle? leadingAndTrailingTextStyle;

  final ListTileStyle? style;

  final EdgeInsetsGeometry? contentPadding;

  final bool enabled;

  final GestureTapCallback? onTap;

  final GestureLongPressCallback? onLongPress;

  final ValueChanged<bool>? onFocusChange;

  final MouseCursor? mouseCursor;

  final bool selected;

  final Color? focusColor;

  final Color? hoverColor;

  final Color? splashColor;

  final FocusNode? focusNode;

  final bool autofocus;

  final Color? tileColor;

  final Color? selectedTileColor;

  final bool? enableFeedback;

  final double? horizontalTitleGap;

  final double? minVerticalPadding;

  final double? minLeadingWidth;
  final double? minTileHeight;
  final ListTileTitleAlignment? titleAlignment;
  final bool internalAddSemanticForOnTap;

  const FListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingAndTrailingTextStyle,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus = false,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.minTileHeight,
    this.titleAlignment,
    this.internalAddSemanticForOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      excludeSemantics: true,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        dense: dense,
        visualDensity: visualDensity,
        shape: shape,
        selectedColor: selectedColor,
        iconColor: iconColor,
        textColor: textColor,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
        style: style,
        contentPadding: contentPadding,
        enabled: enabled,
        onTap: onTap,
        onLongPress: onLongPress,
        onFocusChange: onFocusChange,
        mouseCursor: mouseCursor,
        selected: selected,
        focusColor: focusColor,
        hoverColor: hoverColor,
        splashColor: splashColor,
        focusNode: focusNode,
        autofocus: autofocus,
        tileColor: tileColor,
        selectedTileColor: selectedTileColor,
        enableFeedback: enableFeedback,
        horizontalTitleGap: horizontalTitleGap,
        minVerticalPadding: minVerticalPadding,
        minLeadingWidth: minLeadingWidth,
        minTileHeight: minTileHeight,
        titleAlignment: titleAlignment,
        internalAddSemanticForOnTap: internalAddSemanticForOnTap,
      ),
    );
  }
}

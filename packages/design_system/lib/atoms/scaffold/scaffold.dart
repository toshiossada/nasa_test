import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final DragStartBehavior drawerDragStartBehavior;
  final Widget? bottomSheet;
  final AlignmentDirectional persistentFooterAlignment;
  final bool primary;
  final bool? resizeToAvoidBottomInset;

  const FScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.bottomSheet,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.primary = true,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return FSemantics(
      identifier: super.key?.keyValue,
      child: Scaffold(
        appBar: appBar,
        body: body,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        endDrawer: endDrawer,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        restorationId: restorationId,
        onDrawerChanged: onDrawerChanged,
        onEndDrawerChanged: onEndDrawerChanged,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerDragStartBehavior: drawerDragStartBehavior,
        bottomSheet: bottomSheet,
        persistentFooterAlignment: persistentFooterAlignment,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      ),
    );
  }
}

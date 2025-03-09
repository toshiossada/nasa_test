import 'package:flutter/material.dart';

import '../../atoms.dart';
import '../../extensions/key_extension.dart';

class FListView extends StatelessWidget {
  final Widget child;

  FListView({
    required List<Widget> children,
    super.key,
    bool shrinkWrap = false,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
  }) : child = ListView(
         physics: physics,
         padding: padding,
         shrinkWrap: shrinkWrap,
         controller: controller,
         scrollDirection: scrollDirection,
         children: children,
       );

  FListView.separated({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    super.key,
    bool shrinkWrap = false,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
  }) : child = ListView.separated(
         itemCount: itemCount,
         itemBuilder: itemBuilder,
         separatorBuilder: separatorBuilder,
         shrinkWrap: shrinkWrap,
         controller: controller,
         padding: padding,
         scrollDirection: scrollDirection,
         physics: physics,
       );

  FListView.builder({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    super.key,
    bool shrinkWrap = false,
    ScrollController? controller,
    EdgeInsetsGeometry? padding,
    Axis scrollDirection = Axis.vertical,
    ScrollPhysics? physics,
  }) : child = ListView.builder(
         itemCount: itemCount,
         itemBuilder: itemBuilder,
         shrinkWrap: shrinkWrap,
         controller: controller,
         padding: padding,
         scrollDirection: scrollDirection,
         physics: physics,
       );

  @override
  Widget build(BuildContext context) {
    return FSemantics(identifier: super.key?.keyValue, child: child);
  }
}

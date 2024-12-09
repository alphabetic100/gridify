library gridify;

import 'package:flutter/widgets.dart';
import 'package:gridify/dynamic-height-gridview/dynamic_height_grid_view.dart';
import 'package:gridify/regular-grid-view/regular_grid_view.dart';

enum GridifyHeight {
  dynamic,
  regular,
}

class Gridify extends StatefulWidget {
  const Gridify({
    super.key,
    required this.gridifyHeight,
    required this.child,
    this.padding,
    required this.length, this.scale,
  });
  final GridifyHeight gridifyHeight;
  final int length;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? scale;
  @override
  State<Gridify> createState() => _GridifyState();
}

class _GridifyState extends State<Gridify> {
  @override
  Widget build(BuildContext context) {
    if (widget.gridifyHeight == GridifyHeight.dynamic) {
      return DynamicHeightGridView(
        padding: widget.padding,
        length: widget.length,
        scale: widget.scale,
        child: widget.child,
      );
    } else if (widget.gridifyHeight == GridifyHeight.regular) {
      return const RegularGridView();
    } else {
      return const SizedBox();
    }
  }
}

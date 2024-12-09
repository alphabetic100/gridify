library gridify;

import 'package:flutter/material.dart';
import 'package:gridify/dynamic-height-gridview/dynamic_height_values.dart';

class Gridify extends StatefulWidget {
  const Gridify({
    super.key,
    this.padding,
    required this.itemCount,
    required this.builder,
    this.scale,
    this.borderRadius,
    this.color,
    required this.ontap,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) builder;
  final double? scale;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback ontap;

  @override
  State<Gridify> createState() => _GridifyState();
}

class _GridifyState extends State<Gridify> {
  List<int> evenList = [];
  List<int> oddList = [];
  late List<double> heights;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.itemCount; i++) {
      if (i % 2 == 0) {
        evenList.add(i);
      } else {
        oddList.add(i);
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    heights = getDynamicHeights(context, widget.itemCount);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Even list column
            Expanded(
              child: Column(
                children: List.generate(evenList.length, (index) {
                  int actualIndex = evenList[index];
                  return Padding(
                    padding: widget.padding ?? const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: widget.borderRadius ?? BorderRadius.zero,
                      child: GestureDetector(
                        onTap: widget.ontap,
                        child: Container(
                          height: heights[actualIndex] * (widget.scale ?? 1),
                          color: widget.color,
                          child: widget.builder(context, actualIndex),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            // Odd list column
            Expanded(
              child: Column(
                children: List.generate(oddList.length, (index) {
                  int actualIndex = oddList[index];
                  return Padding(
                    padding: widget.padding ?? const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: widget.borderRadius ?? BorderRadius.zero,
                      child: GestureDetector(
                        onTap: widget.ontap,
                        child: Container(
                          height: heights[actualIndex] * (widget.scale ?? 1),
                          color: widget.color,
                          child: widget.builder(context, actualIndex),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

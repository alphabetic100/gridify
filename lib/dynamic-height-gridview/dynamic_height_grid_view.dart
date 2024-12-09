import 'package:flutter/material.dart';
import 'package:gridify/dynamic-height-gridview/dynamic_height_values.dart';

class DynamicHeightGridView extends StatefulWidget {
  const DynamicHeightGridView({
    super.key,
    this.padding,
    required this.length,
    required this.child,
    this.scale,
  });
  final int length;
  final Widget child;
  final double? scale;
  final EdgeInsetsGeometry? padding;
  @override
  State<DynamicHeightGridView> createState() => _DynamicHeightGridViewState();
}

class _DynamicHeightGridViewState extends State<DynamicHeightGridView> {
  List evenList = [];
  List oddList = [];

  @override
  void initState() {
    for (int i = 0; i < widget.length; i++) {
      if (i % 2 == 0) {
        evenList.add(i);
      } else {
        oddList.add(i);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<double> heights = getDynamicHeights(context, widget.length);
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //even list
            Column(
              children: List.generate(evenList.length, (index) {
                return Padding(
                  padding: widget.padding ?? const EdgeInsets.all(0),
                  child: Container(
                    height: heights[evenList[index]] * (widget.scale ?? 1),
                    width: MediaQuery.of(context).size.width * 0.45,
                    color: Colors.amber,
                    child: widget.child,
                  ),
                );
              }),
            ),
            //odd list
            Column(
              children: List.generate(oddList.length, (index) {
                return Padding(
                  padding: widget.padding ?? const EdgeInsets.all(0),
                  child: Container(
                    height: heights[oddList[index]] * (widget.scale ?? 1),
                    width: MediaQuery.of(context).size.width * 0.45,
                    color: Colors.amber,
                    child: widget.child,
                  ),
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}

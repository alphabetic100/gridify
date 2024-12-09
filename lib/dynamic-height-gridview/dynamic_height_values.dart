import 'package:flutter/widgets.dart';

List<double> getDynamicHeights(BuildContext context, int length) {
  List<double> dynamicHeight = [
    MediaQuery.of(context).size.height * 0.5,
    MediaQuery.of(context).size.height * 0.45,
    MediaQuery.of(context).size.height * 0.35,
  ];

  List<double> result = [];

  for (int i = 0; i < length; i++) {
    dynamicHeight.shuffle();
    result.add(dynamicHeight[i % dynamicHeight.length]);
  }

  return result;
}

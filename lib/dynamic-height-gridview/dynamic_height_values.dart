import 'package:flutter/widgets.dart';

List<double> getDynamicHeights(BuildContext context, int length) {
  List<double> dynamicHeight = [
    MediaQuery.of(context).size.height * 0.7,
    MediaQuery.of(context).size.height * 0.6,
    MediaQuery.of(context).size.height * 0.5,
    MediaQuery.of(context).size.height * 0.4,
  ];

  List<double> result = [];

  for (int i = 0; i < length; i++) {
    dynamicHeight.shuffle();
    result.add(dynamicHeight[i % dynamicHeight.length]);
  }

  return result;
}

import 'package:flutter/widgets.dart';

class RegularGridView extends StatefulWidget {
  const RegularGridView({super.key});

  @override
  State<RegularGridView> createState() => _RegularGridViewState();
}

class _RegularGridViewState extends State<RegularGridView> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is regular gridify");
  }
}

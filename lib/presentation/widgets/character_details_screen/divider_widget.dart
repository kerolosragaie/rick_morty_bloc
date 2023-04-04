import 'dart:ffi';

import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double endIndent;
  const DividerWidget({super.key, this.endIndent = 0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30.0,
      endIndent: endIndent,
      color: Colors.black,
      thickness: 0.95,
    );
  }
}

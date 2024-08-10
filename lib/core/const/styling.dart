import 'package:flutter/material.dart';

class Styling {
  static BoxShadow get boxshadow {
    return BoxShadow(
      blurRadius: 8,
      spreadRadius: 2,
      offset: const Offset(2, 2),
      color: Colors.black38.withOpacity(0.2),
    );
  }
}

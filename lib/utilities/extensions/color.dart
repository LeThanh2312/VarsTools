import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

final List<BoxShadow> boxShadowItem = <BoxShadow>[
  BoxShadow(
    color: HexColor("#0D000000"),
    offset: Offset(0, 1),
    blurRadius: 2,
  ),
];
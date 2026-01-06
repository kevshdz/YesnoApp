

import 'package:flutter/material.dart';

const List<Color> _ColorThemes = [
  Colors.white,
  Colors.black,
  Colors.amber,
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.purple
];


class ThemeApp {
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _ColorThemes[2]
    );
  }

}
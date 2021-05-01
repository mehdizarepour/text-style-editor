import 'package:flutter/material.dart';
import 'package:text_style_editor/src/color_palette.dart';

class FontColorTool extends StatelessWidget {
  final List<Color> colors;
  final Color? activeColor;
  final Function(Color) onColorPicked;

  FontColorTool({
    required this.colors,
    required this.onColorPicked,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ColorPalette(
      activeColor: activeColor,
      onColorPicked: onColorPicked,
      colors: colors,
    );
  }
}

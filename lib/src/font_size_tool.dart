import 'package:flutter/material.dart';

class FontSizeTool extends StatefulWidget {
  final double fontSize;
  final double letterSpacing;
  final double letterHeight;

  FontSizeTool({
    this.fontSize = 0,
    this.letterSpacing = 0,
    this.letterHeight = 0,
  });

  @override
  _FontSizeToolState createState() => _FontSizeToolState();
}

class _FontSizeToolState extends State<FontSizeTool> {
  late double _fontSize;
  late double _letterSpacing;
  late double _letterHeight;

  @override
  void initState() {
    _fontSize = widget.fontSize;
    _letterSpacing = widget.letterSpacing;
    _letterHeight = widget.letterHeight;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _ReSizeSlider(
            value: _fontSize,
            icon: Icons.format_size,
            onChange: (value) => setState(() => _fontSize = value),
          ),
          _ReSizeSlider(
            value: _letterHeight,
            icon: Icons.format_line_spacing,
            onChange: (value) => setState(() => _letterHeight = value),
          ),
          _ReSizeSlider(
            value: _letterSpacing,
            icon: Icons.settings_ethernet,
            onChange: (value) => setState(() => _letterSpacing = value),
          ),
        ],
      ),
    );
  }
}

class _ReSizeSlider extends StatelessWidget {
  final double value;
  final IconData icon;
  final Function(double) onChange;

  _ReSizeSlider({
    required this.value,
    required this.icon,
    required this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Expanded(
          child: Slider(
            value: value,
            onChanged: onChange,
            min: 0,
            max: 100,
          ),
        ),
        Text(value.toInt().toString()),
      ],
    );
  }
}

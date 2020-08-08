import 'package:flutter/material.dart';

class FontSizeTool extends StatefulWidget {
  @override
  _FontSizeToolState createState() => _FontSizeToolState();
}

class _FontSizeToolState extends State<FontSizeTool> {
  double currentFontSize;
  final double minFontSize;
  final double maxFontSize;

  _FontSizeToolState({this.currentFontSize = 16, this.minFontSize = 1, this.maxFontSize = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _SliderValueSelector(
            minValue: 1,
            maxValue: 100,
            defaultValue: 16,
            leftIcon: Icon(Icons.format_bold, size: 10),
            rightIcon: Icon(Icons.format_bold, size: 15),
          ),
          _SliderValueSelector(
            minValue: 1,
            maxValue: 100,
            defaultValue: 5,
            leftIcon: Icon(Icons.format_bold, size: 15),
            rightIcon: Icon(Icons.format_bold, size: 15),
          ),
          _SliderValueSelector(
            minValue: 1,
            maxValue: 100,
            defaultValue: 30,
            leftIcon: Icon(Icons.format_bold, size: 15),
            rightIcon: Icon(Icons.format_bold, size: 15),
          ),
        ],
      )
    );
  }
}

class _SliderValueSelector extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double defaultValue;
  final Icon leftIcon;
  final Icon rightIcon;

  _SliderValueSelector({
    @required this.minValue,
    @required this.maxValue,
    @required this.leftIcon,
    @required this.rightIcon,
    this.defaultValue
  });

  @override
  _SliderValueSelectorState createState() => _SliderValueSelectorState();
}

class _SliderValueSelectorState extends State<_SliderValueSelector> {
  double currentValue;

  @override
  void initState() {
    currentValue = widget.defaultValue != null ? widget.defaultValue : widget.maxValue / 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          widget.leftIcon,
          Expanded(
            child: Slider(
              value: currentValue,
              min: widget.minValue,
              max: widget.maxValue,
              divisions: widget.maxValue.toInt(),
              activeColor: Colors.black26,
              inactiveColor: Colors.grey[300],
              // label: currentValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ),
          widget.rightIcon,
        ],
      )
    );
  }
}

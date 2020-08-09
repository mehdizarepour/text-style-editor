import 'package:flutter/material.dart';
import 'custom-text-style.dart';

class FontSizeTool extends StatefulWidget {
  final CustomTextStyle defaultTextStyle;
  final ValueChanged<CustomTextStyle> onTextStyleChanged;

  FontSizeTool({@required this.defaultTextStyle, @required this.onTextStyleChanged});

  @override
  _FontSizeToolState createState() => _FontSizeToolState();
}

class _FontSizeToolState extends State<FontSizeTool> {
  CustomTextStyle textStyle;

  @override
  void initState() {
    textStyle = widget.defaultTextStyle;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /// FontSize slider
          _SliderValueSelector(
            minValue: 1,
            maxValue: 100,
            defaultValue: widget.defaultTextStyle.fontSize,
            leftIcon: Icon(Icons.format_bold, size: 10),
            rightIcon: Icon(Icons.format_bold, size: 15),
            onValueChanged: (value) {
              /// Update font size
              textStyle.fontSize = value;

              widget.onTextStyleChanged(textStyle);
            },
          ),
          /// LetterSpacing Slider
          _SliderValueSelector(
            minValue: 0,
            maxValue: 100,
            defaultValue: 0.0,
            leftIcon: Icon(Icons.format_bold, size: 15),
            rightIcon: Icon(Icons.format_bold, size: 15),
            onValueChanged: (value) {
              /// Update font size
              textStyle.letterSpacing = value;

              widget.onTextStyleChanged(textStyle);
            },
          ),
          /// Text hight slider
          _SliderValueSelector(
            minValue: 1,
            maxValue: 100,
            defaultValue: 1,
            leftIcon: Icon(Icons.format_bold, size: 15),
            rightIcon: Icon(Icons.format_bold, size: 15),
            onValueChanged: (value) {
              /// Update font size
              textStyle.hight = value;

              widget.onTextStyleChanged(textStyle);
            },
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
  final ValueChanged<double> onValueChanged;

  _SliderValueSelector({
    @required this.minValue,
    @required this.maxValue,
    @required this.leftIcon,
    @required this.rightIcon,
    this.defaultValue,
    this.onValueChanged
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
                  widget.onValueChanged(value);
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

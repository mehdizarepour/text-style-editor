import 'package:flutter/material.dart';
import 'custom_text_style.dart';

class FontSizeTool extends StatefulWidget {
  final CustomTextStyle defaultTextStyle;
  final ValueChanged<CustomTextStyle> onTextStyleChanged;
  final Color primaryColor;
  final Color secondaryColor;

  FontSizeTool({
    @required this.defaultTextStyle,
    @required this.onTextStyleChanged,
    this.primaryColor,
    this.secondaryColor
  });

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
            leftIcon: Icon(Icons.text_fields, size: 15),
            rightIcon: Icon(Icons.text_fields, size: 25),
            activeColor: widget.primaryColor,
            inActiveColor: widget.secondaryColor,
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
            leftIcon: Icon(Icons.settings_ethernet, size: 20),
            rightIcon: Icon(Icons.settings_ethernet, size: 20),
            activeColor: widget.primaryColor,
            inActiveColor: widget.secondaryColor,
            onValueChanged: (value) {
              /// Update font size
              textStyle.letterSpacing = value;

              widget.onTextStyleChanged(textStyle);
            },
          ),
          /// Text hight slider
          _SliderValueSelector(
            minValue: 1,
            maxValue: 10,
            defaultValue: 1,
            leftIcon: Icon(Icons.format_line_spacing, size: 20),
            rightIcon: Icon(Icons.format_line_spacing, size: 20),
            activeColor: widget.primaryColor,
            inActiveColor: widget.secondaryColor,
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
  final Color activeColor;
  final Color inActiveColor;
  final ValueChanged<double> onValueChanged;

  _SliderValueSelector({
    @required this.minValue,
    @required this.maxValue,
    @required this.leftIcon,
    @required this.rightIcon,
    this.activeColor,
    this.inActiveColor,
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
              activeColor: widget.activeColor,
              inactiveColor: widget.inActiveColor,
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

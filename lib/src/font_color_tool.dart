import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'custom-text-style.dart';

class FontColorTool extends StatefulWidget {
  final CustomTextStyle defaultTextStyle;
  final ValueChanged<CustomTextStyle> onTextStyleChanged;

  FontColorTool({@required this.defaultTextStyle, @required this.onTextStyleChanged});

  @override
  _FontColorToolState createState() => _FontColorToolState();
}

class _FontColorToolState extends State<FontColorTool> {
  CustomTextStyle customTextStyle;

  void _onColorSelected(color) {
    widget.defaultTextStyle.color = color;

    widget.onTextStyleChanged(widget.defaultTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(child: _ColorWidget(isColorPicker: true, onColorSelected: _onColorSelected), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.blue, onColorSelected: _onColorSelected),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.yellow, onColorSelected: _onColorSelected), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.green, onColorSelected: _onColorSelected),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.grey, onColorSelected: _onColorSelected), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.red, onColorSelected: _onColorSelected),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.white, onColorSelected: _onColorSelected), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.brown, onColorSelected: _onColorSelected),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.lime, onColorSelected: _onColorSelected), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.black, onColorSelected: _onColorSelected),
            ]
          ),
        ]
      )
    );
  }
}



class _ColorWidget extends StatefulWidget {
  final Color color;
  final bool isColorPicker;
  final ValueChanged<Color> onColorSelected;

  _ColorWidget({
    @required this.onColorSelected,
    this.color = Colors.black,
    this.isColorPicker = false
  });

  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  Color currentColor;

  @override
  void initState() {
    currentColor = widget.color;

    super.initState();
  }

  void openColorPicker() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: Colors.black,
            onColorChanged: widget.onColorSelected,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          FlatButton(
            child: const Text('ok'),
            onPressed: () {
              // setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width / 8;

    return GestureDetector(
      onTap: () {
        if (widget.isColorPicker) {
          openColorPicker();
          return;
        }

        widget.onColorSelected(widget.color);
      },
      child: Container(
        width: maxWidth,
        height: maxWidth,
        decoration: BoxDecoration(
          gradient: widget.isColorPicker
            ? SweepGradient(
              colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.blue],
              stops: [0.0, 0.25, 0.5, 0.75, 1],
            )
            : null,
          color: currentColor,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(100)
        ),
      )
    );
  }
}
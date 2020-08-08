import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FontColorTool extends StatefulWidget {
  @override
  _FontColorToolState createState() => _FontColorToolState();
}

class _FontColorToolState extends State<FontColorTool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(child: _ColorWidget(isColorPicker: true), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.blue),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.yellow), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.green),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.grey), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.red),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.white), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.brown),
            ]
          ),
          Column(
            children: [
              Container(child: _ColorWidget(color: Colors.lime), margin: EdgeInsets.only(bottom: 10),),
              _ColorWidget(color: Colors.black,),
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

  _ColorWidget({this.color, this.isColorPicker = false});

  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  Color currentColor;
  Color pickerColor = Colors.black;

  @override
  void initState() {
    currentColor = widget.color;

    super.initState();
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void openColorPicker() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
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
      onTap: openColorPicker,
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
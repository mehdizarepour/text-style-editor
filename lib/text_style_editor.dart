library text_style_editor;

import 'package:flutter/material.dart';
import 'src/font_color_tool.dart';
import 'src/font_family_tool.dart';
import 'src/font_size_tool.dart';
import 'src/custom-text-style.dart';
import 'src/text_alignment_tool.dart';

class TextStyleEditor extends StatefulWidget {
  final TextStyle textStyle;
  final ValueChanged<TextStyle> onTextStyleChange;
  final ValueChanged<TextAlign> onTextAlignChanged;
  final Color primaryColor;
  final Color secondaryColor;
  final double height;
  
  TextStyleEditor({
    @required this.textStyle,
    @required this.onTextStyleChange,
    this.onTextAlignChanged,
    this.primaryColor = Colors.black12,
    this.secondaryColor = Colors.black26,
    this.height,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  CustomTextStyle customTextStyle;
  Color primaryColor;
  Color secondaryColor;

  int currentToolIndex = 1;
  Widget currentTool;

  final Color activeToolColor = Colors.black;
  final Color inActiveToolColor = Colors.grey;

  @override
  void initState() {
    customTextStyle = CustomTextStyle(
      fontFamily: widget.textStyle.fontFamily,
      fontSize: widget.textStyle.fontSize,
      color: widget.textStyle.color,
      hight: widget.textStyle.height,
      letterSpacing: widget.textStyle.letterSpacing
    );

    currentTool = FontFamilyTool(
      defaultTextStyle: customTextStyle,
      onTextStyleChanged: _onFontFamilyChanged
    );

    super.initState();
  }

  void _onFontFamilyChanged(value) {
    customTextStyle = value;

    widget.onTextStyleChange(TextStyle(
      fontFamily: customTextStyle.fontFamily,
      fontSize: customTextStyle.fontSize,
      height: customTextStyle.hight,
      letterSpacing: customTextStyle.letterSpacing,
      color: customTextStyle.color
    ));
  }

  void _onFontSizeChanged(value) {
    customTextStyle = value;

    // TODO: Create utils class to map these classes
    widget.onTextStyleChange(TextStyle(
      fontFamily: customTextStyle.fontFamily,
      fontSize: customTextStyle.fontSize,
      height: customTextStyle.hight,
      letterSpacing: customTextStyle.letterSpacing,
      color: customTextStyle.color
    ));
  }

  void _onFontColorChanged(value) {
    customTextStyle = value;

    // TODO: Create utils class to map these classes
    widget.onTextStyleChange(TextStyle(
      fontFamily: customTextStyle.fontFamily,
      fontSize: customTextStyle.fontSize,
      height: customTextStyle.hight,
      letterSpacing: customTextStyle.letterSpacing,
      color: customTextStyle.color
    ));
  }

  void _changeToolIndex(int index) {
    setState(() {
      currentToolIndex = index;

      if (currentToolIndex == 1) {
        // TODO: Pass selected post to `FontFamilyTool` class
        currentTool = FontFamilyTool(
          defaultTextStyle: customTextStyle,
          onTextStyleChanged: _onFontFamilyChanged
        );
      } else if (currentToolIndex == 2) {
        currentTool = FontSizeTool(
          defaultTextStyle: customTextStyle,
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
          onTextStyleChanged: _onFontSizeChanged,
        );
      } else if (currentToolIndex == 4) {
        currentTool = FontColorTool(
          defaultTextStyle: customTextStyle,
          onTextStyleChanged: _onFontColorChanged,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
                margin: EdgeInsets.only(top: 20, left: constraints.maxWidth * 0.05, right: constraints.maxWidth * 0.05),
                // width: constraints.maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  // border: Border.all(color: widget.secondaryColor),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.text_format, color: currentToolIndex == 1 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeToolIndex(1)
                    ),
                    IconButton(
                      icon: Icon(Icons.text_fields, color: currentToolIndex == 2 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeToolIndex(2)
                    ),
                    TextAlignmentTool(
                      activeColor: activeToolColor,
                      inActiveColor: inActiveToolColor,
                      onTextAlignChanged: widget.onTextAlignChanged,
                    ),
                    IconButton(
                      icon: Icon(Icons.palette, color: currentToolIndex == 4 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeToolIndex(4)
                    ),
                  ]
                )
              ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: currentTool
            ),
          )
        ],
      ),
    );
  }
}
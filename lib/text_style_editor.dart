library text_style_editor;

import 'package:flutter/material.dart';
import 'src/font_color_tool.dart';
import 'src/font_family_tool.dart';
import 'src/font_size_tool.dart';
import 'src/custom_text_style.dart';
import 'src/text_alignment_tool.dart';

class TextStyleEditor extends StatefulWidget {
  final TextStyle textStyle;
  final ValueChanged<TextStyle> onTextStyleChanged;
  final ValueChanged<TextAlign> onTextAlignChanged;
  final Color primaryColor;
  final Color secondaryColor;
  final backgroundColor;
  final double height;

  TextStyleEditor({
    @required this.onTextStyleChanged,
    @required this.onTextAlignChanged,
    this.textStyle,
    this.primaryColor = Colors.black26,
    this.secondaryColor = Colors.black12,
    this.backgroundColor = Colors.white,
    this.height,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  final Color _activeToolColor = Colors.black;
  final Color _inActiveToolColor = Colors.grey;
  TextStyle _textStyle;
  CustomTextStyle _customTextStyle;
  int _currentToolIndex = 1;
  Widget _currentTool;

  @override
  void initState() {
    /// Set default TextStyle
    _textStyle = widget.textStyle == null ? TextStyle() : widget.textStyle;

    _customTextStyle = CustomTextStyle.from(_textStyle);

    _currentTool = FontFamilyTool(
        defaultTextStyle: _customTextStyle,
        onTextStyleChanged: _onFontFamilyChanged);

    super.initState();
  }

  void _onFontFamilyChanged(value) {
    _customTextStyle = value;

    widget.onTextStyleChanged(CustomTextStyle.to(_customTextStyle));
  }

  void _onFontSizeChanged(value) {
    _customTextStyle = value;

    widget.onTextStyleChanged(CustomTextStyle.to(_customTextStyle));
  }

  void _onFontColorChanged(value) {
    _customTextStyle = value;

    widget.onTextStyleChanged(CustomTextStyle.to(_customTextStyle));
  }

  void _changeToolIndex(int index) {
    setState(() {
      _currentToolIndex = index;

      if (_currentToolIndex == 1) {
        // TODO: Pass selected font to `FontFamilyTool` class
        _currentTool = FontFamilyTool(
            defaultTextStyle: _customTextStyle,
            onTextStyleChanged: _onFontFamilyChanged);
      } else if (_currentToolIndex == 2) {
        _currentTool = FontSizeTool(
          defaultTextStyle: _customTextStyle,
          primaryColor: widget.primaryColor,
          secondaryColor: widget.secondaryColor,
          onTextStyleChanged: _onFontSizeChanged,
        );
      } else if (_currentToolIndex == 4) {
        _currentTool = FontColorTool(
          defaultTextStyle: _customTextStyle,
          onTextStyleChanged: _onFontColorChanged,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: widget.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Container(
                    margin: EdgeInsets.only(
                        top: 20,
                        left: constraints.maxWidth * 0.05,
                        right: constraints.maxWidth * 0.05),
                    // width: constraints.maxWidth * 0.9,
                    decoration: BoxDecoration(
                        color: widget.secondaryColor,
                        // border: Border.all(color: widget.secondaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.title,
                                  color: _currentToolIndex == 1
                                      ? _activeToolColor
                                      : _inActiveToolColor),
                              onPressed: () => _changeToolIndex(1)),
                          IconButton(
                              icon: Icon(Icons.tune,
                                  color: _currentToolIndex == 2
                                      ? _activeToolColor
                                      : _inActiveToolColor),
                              onPressed: () => _changeToolIndex(2)),
                          TextAlignmentTool(
                            activeColor: _activeToolColor,
                            inActiveColor: _inActiveToolColor,
                            onTextAlignChanged: widget.onTextAlignChanged,
                          ),
                          IconButton(
                              icon: Icon(Icons.palette,
                                  color: _currentToolIndex == 4
                                      ? _activeToolColor
                                      : _inActiveToolColor),
                              onPressed: () => _changeToolIndex(4)),
                        ])),
          ),
          Expanded(
            child: SingleChildScrollView(child: _currentTool),
          )
        ],
      ),
    );
  }
}

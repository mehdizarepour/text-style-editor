library text_style_editor;

import 'package:flutter/material.dart';

import 'src/color_palette.dart';
import 'src/font_family_tool.dart';
import 'src/font_size_tool.dart';
import 'src/text_format_tool.dart';
import 'src/toolbar.dart';

class TextStyleEditor extends StatefulWidget {
  final List<String> fonts;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Function(TextStyle) onTextStyleEdited;

  TextStyleEditor({
    required this.fonts,
    required this.textStyle,
    required this.textAlign,
    required this.onTextStyleEdited,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  ToolbarAction _currentTool = ToolbarAction.editing;
  late TextStyle _textStyle;

  @override
  void initState() {
    _textStyle = widget.textStyle;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Toolbar(
          onToolSelect: (action) => setState(() => _currentTool = action),
        ),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: () {
              // Choice tools
              switch (_currentTool) {
                case ToolbarAction.fontFamily:
                  return FontFamilyTool(
                    fonts: widget.fonts,
                    onSelectFont: (fontFamily) {
                      setState(() => _textStyle =
                          _textStyle.copyWith(fontFamily: fontFamily));

                      widget.onTextStyleEdited(_textStyle);
                    },
                  );
                case ToolbarAction.strikethrough:
                  return TextFormatTool(
                    onTextFormatEdited: (bold, italic) {},
                    onTextAlignEdited: (align) {},
                    onCpasLockTaggle: (caps) {},
                  );
                case ToolbarAction.fontSize:
                  return FontSizeTool(
                    onFontSizeEdited: (
                      fontSize,
                      letterSpacing,
                      letterHeight,
                    ) {},
                  );
                case ToolbarAction.fontColor:
                  return ColorPalette(
                    activeColor: Colors.green,
                    colors: [
                      Colors.red,
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.brown,
                      Colors.green,
                      Colors.indigoAccent,
                      Colors.lime,
                    ],
                    onColorPicked: (color) {},
                  );
                case ToolbarAction.backgroundColor:
                  return ColorPalette(
                    activeColor: Colors.green,
                    colors: [
                      Colors.red,
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.brown,
                      Colors.green,
                      Colors.indigoAccent,
                      Colors.lime,
                    ],
                    onColorPicked: (color) {},
                  );
                case ToolbarAction.editing:
                  return Container();
                default:
                  return Container();
              }
            }(),
          ),
        ),
      ],
    );
  }
}

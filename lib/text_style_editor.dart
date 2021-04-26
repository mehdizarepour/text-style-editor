library text_style_editor;

import 'package:flutter/material.dart';

import 'src/color_palette.dart';
import 'src/font_family_tool.dart';
import 'src/font_size_tool.dart';
import 'src/text_format_tool.dart';
import 'src/toolbar.dart';

class TextStyleEditor extends StatefulWidget {
  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  ToolbarAction _currentTool = ToolbarAction.editing;

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
                    fonts: [
                      'Font1',
                      'Font2',
                      'Font3',
                      'Font4',
                      'Font5',
                      'Font6',
                      'Font7',
                      'Font8'
                    ],
                    onSelectFont: (fontFamily) {},
                  );
                case ToolbarAction.strikethrough:
                  return TextFormatTool(
                    onTextFormatEdited: (bold, italic, caps) {},
                    onTextAlignEdited: (align) {},
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

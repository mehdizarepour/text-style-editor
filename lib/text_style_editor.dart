library text_style_editor;

import 'package:flutter/material.dart';

import 'src/font_family_tool.dart';
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

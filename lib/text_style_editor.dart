library text_style_editor;

import 'package:flutter/material.dart';

import 'src/font_family_tool.dart';
import 'src/text_format_tool.dart';
import 'src/toolbar.dart';

class TextStyleEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Toolbar(
          onToolSelect: (action) {},
        ),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: TextFormatTool(
              onTextFormatEdited: (bold, italic, caps) {},
              onTextAlignEdited: (align) {},
            ),
            // child: FontFamilyTool(
            //   fonts: [
            //     'Font1',
            //     'Font2',
            //     'Font3',
            //     'Font4',
            //     'Font5',
            //     'Font6',
            //     'Font7',
            //     'Font8'
            //   ],
            //   onSelectFont: (fontFamily) {},
            // ),
          ),
        ),
      ],
    );
  }
}

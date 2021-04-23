library text_style_editor;

import 'package:flutter/material.dart';

import 'src/toolbar.dart';

class TextStyleEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Toolbar(
          onToolSelect: (action) {},
        ),
      ],
    );
  }
}

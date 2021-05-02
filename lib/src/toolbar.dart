import 'package:flutter/material.dart';

import 'option_button.dart';
import 'toolbar_action.dart';

class Toolbar extends StatefulWidget {
  final Function(EditorToolbarAction) onToolSelect;

  Toolbar({required this.onToolSelect});

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  EditorToolbarAction _selectedAction = EditorToolbarAction.editor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.editor,
          child: Icon(Icons.keyboard),
          onPressed: () {
            setState(() => _selectedAction = EditorToolbarAction.editor);
            widget.onToolSelect(EditorToolbarAction.editor);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontFamilyTool,
          child: Icon(Icons.title),
          onPressed: () {
            setState(
                () => _selectedAction = EditorToolbarAction.fontFamilyTool);
            widget.onToolSelect(EditorToolbarAction.fontFamilyTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontOptionTool,
          child: Icon(Icons.strikethrough_s),
          onPressed: () {
            setState(
                () => _selectedAction = EditorToolbarAction.fontOptionTool);
            widget.onToolSelect(EditorToolbarAction.fontOptionTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontSizeTool,
          child: Icon(Icons.format_size),
          onPressed: () {
            setState(() => _selectedAction = EditorToolbarAction.fontSizeTool);
            widget.onToolSelect(EditorToolbarAction.fontSizeTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.fontColorTool,
          child: Icon(Icons.format_color_text),
          onPressed: () {
            setState(() => _selectedAction = EditorToolbarAction.fontColorTool);
            widget.onToolSelect(EditorToolbarAction.fontColorTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == EditorToolbarAction.backgroundColorTool,
          child: Icon(Icons.format_color_fill),
          onPressed: () {
            setState(() =>
                _selectedAction = EditorToolbarAction.backgroundColorTool);
            widget.onToolSelect(EditorToolbarAction.backgroundColorTool);
          },
        ),
      ],
    );
  }
}

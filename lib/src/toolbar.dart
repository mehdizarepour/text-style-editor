import 'package:flutter/material.dart';

import 'option_button.dart';

enum ToolbarAction {
  editor,
  fontFamilyTool,
  fontOptionTool,
  fontSizeTool,
  fontColorTool,
  backgroundColorTool,
}

class Toolbar extends StatefulWidget {
  final Function(ToolbarAction) onToolSelect;

  Toolbar({required this.onToolSelect});

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  ToolbarAction _selectedAction = ToolbarAction.editor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionButton(
          isActive: _selectedAction == ToolbarAction.editor,
          child: Icon(Icons.keyboard),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.editor);
            widget.onToolSelect(ToolbarAction.editor);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontFamilyTool,
          child: Icon(Icons.title),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontFamilyTool);
            widget.onToolSelect(ToolbarAction.fontFamilyTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontOptionTool,
          child: Icon(Icons.strikethrough_s),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontOptionTool);
            widget.onToolSelect(ToolbarAction.fontOptionTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontSizeTool,
          child: Icon(Icons.format_size),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontSizeTool);
            widget.onToolSelect(ToolbarAction.fontSizeTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontColorTool,
          child: Icon(Icons.format_color_text),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontColorTool);
            widget.onToolSelect(ToolbarAction.fontColorTool);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.backgroundColorTool,
          child: Icon(Icons.format_color_fill),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.backgroundColorTool);
            widget.onToolSelect(ToolbarAction.backgroundColorTool);
          },
        ),
      ],
    );
  }
}

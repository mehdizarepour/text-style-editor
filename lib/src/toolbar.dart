import 'package:flutter/material.dart';

import 'option_button.dart';

enum ToolbarAction {
  editing,
  fontFamily,
  strikethrough,
  fontSize,
  fontColor,
  backgroundColor,
}

class Toolbar extends StatefulWidget {
  final Function(ToolbarAction) onToolSelect;

  Toolbar({required this.onToolSelect});

  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  ToolbarAction _selectedAction = ToolbarAction.editing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OptionButton(
          isActive: _selectedAction == ToolbarAction.editing,
          child: Icon(Icons.keyboard),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.editing);
            widget.onToolSelect(ToolbarAction.editing);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontFamily,
          child: Icon(Icons.title),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontFamily);
            widget.onToolSelect(ToolbarAction.fontFamily);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.strikethrough,
          child: Icon(Icons.strikethrough_s),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.strikethrough);
            widget.onToolSelect(ToolbarAction.strikethrough);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontSize,
          child: Icon(Icons.format_size),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontSize);
            widget.onToolSelect(ToolbarAction.fontSize);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.fontColor,
          child: Icon(Icons.format_color_text),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.fontColor);
            widget.onToolSelect(ToolbarAction.fontColor);
          },
        ),
        OptionButton(
          isActive: _selectedAction == ToolbarAction.backgroundColor,
          child: Icon(Icons.format_color_fill),
          onPressed: () {
            setState(() => _selectedAction = ToolbarAction.backgroundColor);
            widget.onToolSelect(ToolbarAction.backgroundColor);
          },
        ),
      ],
    );
  }
}

class _ToolbarItem extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final bool isActive;

  _ToolbarItem({
    required this.icon,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : null,
        borderRadius: BorderRadius.circular(12),
        border: Border.fromBorderSide(BorderSide()),
      ),
      child: Center(child: IconButton(icon: Icon(icon), onPressed: onTap)),
    );
  }
}

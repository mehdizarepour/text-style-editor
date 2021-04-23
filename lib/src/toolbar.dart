import 'package:flutter/material.dart';

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
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.editing,
          icon: Icons.keyboard,
          onTap: () {
            setState(() => _selectedAction = ToolbarAction.editing);
            widget.onToolSelect(ToolbarAction.editing);
          },
        ),
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.fontFamily,
          icon: Icons.title,
          onTap: () {
            setState(() => _selectedAction = ToolbarAction.fontFamily);
            widget.onToolSelect(ToolbarAction.fontFamily);
          },
        ),
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.strikethrough,
          icon: Icons.strikethrough_s,
          onTap: () {
            setState(() => _selectedAction = ToolbarAction.strikethrough);
            widget.onToolSelect(ToolbarAction.strikethrough);
          },
        ),
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.fontSize,
          icon: Icons.format_size,
          onTap: () {
            setState(() => _selectedAction = ToolbarAction.fontSize);
            widget.onToolSelect(ToolbarAction.fontSize);
          },
        ),
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.fontColor,
          icon: Icons.format_color_text,
          onTap: () {
            setState(() => _selectedAction = ToolbarAction.fontColor);
            widget.onToolSelect(ToolbarAction.fontColor);
          },
        ),
        _ToolbarItem(
          isActive: _selectedAction == ToolbarAction.backgroundColor,
          icon: Icons.format_color_fill,
          onTap: () {
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
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(BorderSide()),
      ),
      child: Center(child: IconButton(icon: Icon(icon), onPressed: onTap)),
    );
  }
}

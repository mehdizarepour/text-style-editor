import 'package:flutter/material.dart';

import 'option_button.dart';

class TextFormatTool extends StatefulWidget {
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  TextFormatTool({this.textAlign, this.textStyle});

  @override
  _TextFormatToolState createState() => _TextFormatToolState();
}

class _TextFormatToolState extends State<TextFormatTool> {
  late TextAlign _textAlign;
  late TextStyle _textStyle;

  @override
  void initState() {
    _textAlign = widget.textAlign ?? TextAlign.left;
    _textStyle = widget.textStyle ?? TextStyle();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _TextFormatEditor(),
          SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _TextAlignOption(icon: Icons.format_align_left, onPressed: () {}),
              _TextAlignOption(
                  icon: Icons.format_align_center, onPressed: () {}),
              _TextAlignOption(
                  icon: Icons.format_align_right, onPressed: () {}),
              _TextAlignOption(
                  icon: Icons.format_align_justify, onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}

class _TextAlignOption extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final bool isActive;

  _TextAlignOption({
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      icon: Icon(icon),
      onPressed: () {},
    );
  }
}

class _TextFormatEditor extends StatefulWidget {
  final bool bold;
  final bool italic;
  final bool caps;

  _TextFormatEditor({
    this.bold = false,
    this.italic = false,
    this.caps = false,
  });

  @override
  _TextFormatEditorState createState() => _TextFormatEditorState();
}

class _TextFormatEditorState extends State<_TextFormatEditor> {
  late bool _bold;
  late bool _italic;
  late bool _caps;

  @override
  void initState() {
    _bold = widget.bold;
    _italic = widget.italic;
    _caps = widget.caps;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TextFormatOption(
          title: 'BOLD',
          icon: Icons.format_bold,
          isActive: _bold,
          onPressed: () => setState(() => _bold = !_bold),
        ),
        _TextFormatOption(
          title: 'ITALIC',
          icon: Icons.format_italic,
          onPressed: () => setState(() => _italic = !_italic),
        ),
        _TextFormatOption(
          title: 'CAPS',
          icon: Icons.keyboard_capslock,
          onPressed: () => setState(() => _caps = !_caps),
        ),
      ],
    );
  }
}

class _TextFormatOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;
  final bool isActive;

  _TextFormatOption({
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionButton(
          isActive: isActive,
          onPressed: onPressed,
          child: Icon(icon),
        ),
        SizedBox(height: 12),
        Text(title),
      ],
    );
  }
}

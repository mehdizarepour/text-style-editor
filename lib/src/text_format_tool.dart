import 'package:flutter/material.dart';

import 'option_button.dart';

class TextFormatTool extends StatefulWidget {
  @override
  _TextFormatToolState createState() => _TextFormatToolState();
}

class _TextFormatToolState extends State<TextFormatTool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _TextFormatOption(
                title: 'BOLD',
                icon: Icons.format_bold,
                onPressed: () {},
              ),
              _TextFormatOption(
                title: 'ITALIC',
                icon: Icons.format_italic,
                onPressed: () {},
              ),
              _TextFormatOption(
                title: 'CAPS',
                icon: Icons.keyboard_capslock,
                onPressed: () {},
              ),
            ],
          ),
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
          onPressed: () {},
          child: Icon(icon),
        ),
        SizedBox(height: 12),
        Text(title),
      ],
    );
  }
}

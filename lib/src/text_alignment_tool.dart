import 'package:flutter/material.dart';

class TextAlignmentTool extends StatefulWidget {
  final TextAlign textAlign;
  final Color activeColor;
  final Color inActiveColor;
  final ValueChanged<TextAlign> onTextAlignChanged;

  TextAlignmentTool({
    @required this.onTextAlignChanged,
    this.textAlign,
    this.activeColor,
    this.inActiveColor,
  });

  @override
  _TextAlignmentToolState createState() => _TextAlignmentToolState();
}

class _TextAlignmentToolState extends State<TextAlignmentTool> {
  Color _color;
  IconData _currentIcon = Icons.format_align_left;
  TextAlign _currentTextAlingment = TextAlign.left;

  @override
  void initState() {
    _color = widget.inActiveColor;

    super.initState();
  }

  void _onChangeAlignment() {
    setState(() {
      _color = widget.inActiveColor;

      switch (_currentTextAlingment) {
        case TextAlign.left:
          _currentTextAlingment = TextAlign.center;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_center;
          break;
        case TextAlign.center:
          _currentTextAlingment = TextAlign.right;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_right;
          break;
        default:
          _currentTextAlingment = TextAlign.left;
          widget.onTextAlignChanged(_currentTextAlingment);
          _currentIcon = Icons.format_align_left;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (_) => setState(() => _color = widget.activeColor),
        onTapUp: (_) => _onChangeAlignment(),
        child: Icon(_currentIcon, color: _color));
  }
}

library text_style_editor;

import 'package:flutter/material.dart';

import 'src/background_color_tool.dart';
import 'src/color_palette.dart';
import 'src/font_family_tool.dart';
import 'src/font_size_tool.dart';
import 'src/text_format_tool.dart';
import 'src/toolbar.dart';

class TextStyleEditor extends StatefulWidget {
  final List<String> fonts;
  final List<Color>? paletteColors;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Function(TextStyle) onTextStyleEdited;
  final Function(TextAlign) onTextAlignEdited;
  final Function(bool) onCpasLockTaggle;

  TextStyleEditor({
    required this.fonts,
    this.paletteColors,
    required this.textStyle,
    required this.textAlign,
    required this.onTextStyleEdited,
    required this.onTextAlignEdited,
    required this.onCpasLockTaggle,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  ToolbarAction _currentTool = ToolbarAction.editing;
  late TextStyle _textStyle;
  late TextAlign _textAlign;
  late List<Color> _paletteColors;

  @override
  void initState() {
    _textStyle = widget.textStyle;
    _textAlign = widget.textAlign;

    // Set default palette's colors
    _paletteColors = widget.paletteColors ??
        [
          Colors.black,
          Colors.white,
          Colors.red,
          Colors.blue,
          Colors.blueAccent,
          Colors.brown,
          Colors.green,
          Colors.indigoAccent,
          Colors.lime,
        ];

    super.initState();
  }

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
                    fonts: widget.fonts,
                    selectedFont: _textStyle.fontFamily,
                    onSelectFont: (fontFamily) {
                      setState(() => _textStyle =
                          _textStyle.copyWith(fontFamily: fontFamily));

                      widget.onTextStyleEdited(_textStyle);
                    },
                  );
                case ToolbarAction.strikethrough:
                  return TextFormatTool(
                    bold: _textStyle.fontWeight == FontWeight.bold,
                    italic: _textStyle.fontStyle == FontStyle.italic,
                    textAlign: _textAlign,
                    onTextFormatEdited: (bold, italic) {
                      setState(() => _textStyle = _textStyle.copyWith(
                            fontWeight:
                                bold ? FontWeight.bold : FontWeight.normal,
                            fontStyle:
                                italic ? FontStyle.italic : FontStyle.normal,
                          ));

                      widget.onTextStyleEdited(_textStyle);
                    },
                    onTextAlignEdited: (align) {
                      setState(() => _textAlign = align);

                      widget.onTextAlignEdited(align);
                    },
                    onCpasLockTaggle: widget.onCpasLockTaggle,
                  );
                case ToolbarAction.fontSize:
                  return FontSizeTool(
                    fontSize: _textStyle.fontSize ?? 0,
                    letterHeight: _textStyle.height ?? 1.2,
                    letterSpacing: _textStyle.letterSpacing ?? 1,
                    onFontSizeEdited: (
                      fontSize,
                      letterSpacing,
                      letterHeight,
                    ) {
                      setState(() => _textStyle = _textStyle.copyWith(
                            fontSize: fontSize,
                            height: letterHeight,
                            letterSpacing: letterSpacing,
                          ));

                      widget.onTextStyleEdited(_textStyle);
                    },
                  );
                case ToolbarAction.fontColor:
                  return BackgroundColorTool(
                    activeColor: _textStyle.color,
                    colors: _paletteColors,
                    onColorPicked: (color) {
                      setState(
                          () => _textStyle = _textStyle.copyWith(color: color));

                      widget.onTextStyleEdited(_textStyle);
                    },
                  );
                case ToolbarAction.backgroundColor:
                  return ColorPalette(
                    activeColor: _textStyle.backgroundColor,
                    colors: _paletteColors,
                    onColorPicked: (color) {
                      setState(() => _textStyle =
                          _textStyle.copyWith(backgroundColor: color));

                      widget.onTextStyleEdited(_textStyle);
                    },
                  );
                case ToolbarAction.editing:
                  return Container();
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

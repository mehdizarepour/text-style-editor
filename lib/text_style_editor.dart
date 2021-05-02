library text_style_editor;

export 'src/toolbar_action.dart';

import 'package:flutter/material.dart';
import 'src/toolbar_action.dart';
import 'src/tools/background_color_tool.dart';
import 'src/color_palette.dart';
import 'src/tools/font_family_tool.dart';
import 'src/tools/font_size_tool.dart';
import 'src/tools/text_format_tool.dart';
import 'src/toolbar.dart';

class TextStyleEditor extends StatefulWidget {
  final List<String> fonts;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final List<Color>? paletteColors;
  final Function(TextStyle)? onTextStyleEdited;
  final Function(TextAlign)? onTextAlignEdited;
  final Function(bool)? onCpasLockTaggle;
  final Function(EditorToolbarAction)? onToolbarActionChanged;

  TextStyleEditor({
    required this.fonts,
    required this.textStyle,
    required this.textAlign,
    this.paletteColors,
    this.onTextStyleEdited,
    this.onTextAlignEdited,
    this.onCpasLockTaggle,
    this.onToolbarActionChanged,
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  EditorToolbarAction _currentTool = EditorToolbarAction.editor;
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
          onToolSelect: (action) {
            setState(() => _currentTool = action);
            if (widget.onToolbarActionChanged != null) {
              widget.onToolbarActionChanged!(action);
            }
          },
        ),
        Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: () {
              // Choice tools
              switch (_currentTool) {
                case EditorToolbarAction.fontFamilyTool:
                  return FontFamilyTool(
                    fonts: widget.fonts,
                    selectedFont: _textStyle.fontFamily,
                    onSelectFont: (fontFamily) {
                      setState(() => _textStyle =
                          _textStyle.copyWith(fontFamily: fontFamily));

                      if (widget.onTextStyleEdited != null) {
                        widget.onTextStyleEdited!(_textStyle);
                      }
                    },
                  );
                case EditorToolbarAction.fontOptionTool:
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

                      if (widget.onTextStyleEdited != null) {
                        widget.onTextStyleEdited!(_textStyle);
                      }
                    },
                    onTextAlignEdited: (align) {
                      setState(() => _textAlign = align);

                      if (widget.onTextAlignEdited != null) {
                        widget.onTextAlignEdited!(align);
                      }
                    },
                    onCpasLockTaggle: (caps) {
                      if (widget.onCpasLockTaggle != null) {
                        widget.onCpasLockTaggle!(caps);
                      }
                    },
                  );
                case EditorToolbarAction.fontSizeTool:
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

                      if (widget.onTextStyleEdited != null) {
                        widget.onTextStyleEdited!(_textStyle);
                      }
                    },
                  );
                case EditorToolbarAction.fontColorTool:
                  return BackgroundColorTool(
                    activeColor: _textStyle.color,
                    colors: _paletteColors,
                    onColorPicked: (color) {
                      setState(
                          () => _textStyle = _textStyle.copyWith(color: color));

                      if (widget.onTextStyleEdited != null) {
                        widget.onTextStyleEdited!(_textStyle);
                      }
                    },
                  );
                case EditorToolbarAction.backgroundColorTool:
                  return ColorPalette(
                    activeColor: _textStyle.backgroundColor,
                    colors: _paletteColors,
                    onColorPicked: (color) {
                      setState(() => _textStyle =
                          _textStyle.copyWith(backgroundColor: color));

                      if (widget.onTextStyleEdited != null) {
                        widget.onTextStyleEdited!(_textStyle);
                      }
                    },
                  );
                case EditorToolbarAction.editor:
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

library text_style_editor;

import 'package:flutter/material.dart';
import 'src/font_family_tool.dart';

class TextStyleEditor extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double height;
  
  TextStyleEditor({
    this.primaryColor = Colors.black12,
    this.secondaryColor = Colors.black26,
    this.height = 200
  });

  @override
  _TextStyleEditorState createState() => _TextStyleEditorState();
}

class _TextStyleEditorState extends State<TextStyleEditor> {
  int currentToolIndex = 1;
  final Color activeToolColor = Colors.black;
  final Color inActiveToolColor = Colors.grey;

  void _changeOptionIndex(int index) {
    setState(() {
      currentToolIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
                margin: EdgeInsets.only(top: 20, left: constraints.maxWidth * 0.05, right: constraints.maxWidth * 0.05),
                // width: constraints.maxWidth * 0.9,
                decoration: BoxDecoration(
                  color: widget.primaryColor,
                  border: Border.all(color: widget.secondaryColor),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.text_format, color: currentToolIndex == 1 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeOptionIndex(1)
                    ),
                    IconButton(
                      icon: Icon(Icons.text_fields, color: currentToolIndex == 2 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeOptionIndex(2)
                    ),
                    IconButton(
                      icon: Icon(Icons.format_align_left, color: currentToolIndex == 3 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeOptionIndex(3)
                    ),
                    IconButton(
                      icon: Icon(Icons.palette, color: currentToolIndex == 4 ? activeToolColor : inActiveToolColor),
                      onPressed: () => _changeOptionIndex(4)
                    ),
                  ]
                )
              ),
          ),

          FontFamilyTool()

        ],
      ),
    );
  }
}
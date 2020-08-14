import 'package:flutter/material.dart';
import 'custom_text_style.dart';

class FontColorTool extends StatefulWidget {
  final CustomTextStyle defaultTextStyle;
  final ValueChanged<CustomTextStyle> onTextStyleChanged;

  FontColorTool(
      {@required this.defaultTextStyle, @required this.onTextStyleChanged});

  @override
  _FontColorToolState createState() => _FontColorToolState();
}

class _FontColorToolState extends State<FontColorTool> {
  CustomTextStyle customTextStyle;

  void _onColorSelected(color) {
    widget.defaultTextStyle.color = color;

    widget.onTextStyleChanged(widget.defaultTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ColorWidget(
                color: Colors.black,
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Colors.white,
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff112CBC4')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xffFDA7DF')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xffED4C67')),
                onColorSelected: _onColorSelected,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ColorWidget(
                color: Color(int.parse('0xffF79F1F')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xffA3CB38')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff1289A7')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xffD980FA')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xffB53471')),
                onColorSelected: _onColorSelected,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ColorWidget(
                color: Color(int.parse('0xffEE5A24')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff009432')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff0652DD')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff9980FA')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff833471')),
                onColorSelected: _onColorSelected,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ColorWidget(
                color: Color(int.parse('0xffEA2027')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff006266')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff1B1464')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff5758BB')),
                onColorSelected: _onColorSelected,
              ),
              _ColorWidget(
                color: Color(int.parse('0xff6F1E51')),
                onColorSelected: _onColorSelected,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorWidget extends StatefulWidget {
  final Color color;
  final bool isColorPicker;
  final ValueChanged<Color> onColorSelected;

  _ColorWidget(
      {@required this.onColorSelected,
      this.color = Colors.black,
      this.isColorPicker = false});

  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  Color currentColor;

  @override
  void initState() {
    currentColor = widget.color;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width / 5.6;

    return GestureDetector(
        onTap: () => widget.onColorSelected(widget.color),
        child: Container(
          width: maxWidth,
          height: maxWidth / 2,
          decoration: BoxDecoration(
            gradient: widget.isColorPicker
                ? SweepGradient(
                    colors: [
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.red,
                      Colors.blue
                    ],
                    stops: [0.0, 0.25, 0.5, 0.75, 1],
                  )
                : null,
            color: currentColor,
            // border: Border.all(color: Colors.black12),
            // borderRadius: BorderRadius.circular(100)
          ),
        ));
  }
}

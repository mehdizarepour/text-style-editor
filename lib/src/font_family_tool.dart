import 'package:flutter/material.dart';
import 'custom_text_style.dart';

class FontFamilyTool extends StatelessWidget {
  final CustomTextStyle defaultTextStyle;
  final ValueChanged<CustomTextStyle> onTextStyleChanged;

  FontFamilyTool({@required this.onTextStyleChanged, @required this.defaultTextStyle});

  // Font family list
  final List<String> fonts = [
    'Billabong',
    'OpenSans-Regular',
    'ChunkFive-Regular',
    'AlexBrush-Regular',
    'Lobster_1.3',
    'Allura-Regular',
    'Arizonia-Regular',
    'GrandHotel-Regular',
    'GreatVibes-Regular',
    'OstrichSans-Medium',
    'Oswald-Regular',
    'Pacifico',
    'Quicksand-Regular',
    'Roboto-Regular',
    'SEASRN',
    'SourceSansPro-Regular',
    'Windsong',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
            children: fonts.map((font) => Container(
              child: FontSelector('Sample', font, (selectedFont) {
                defaultTextStyle.fontFamily = selectedFont;

                onTextStyleChanged(defaultTextStyle);
              })
            )).toList(),
          )
        ),
      )
    );
  }
}

class FontSelector extends StatelessWidget {
  final String font;
  final String text;
  final ValueChanged<String> onFontSelected;

  FontSelector(this.text, this.font, this.onFontSelected);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => onFontSelected(font),
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
      child: Text(text, style: TextStyle(fontSize: 18, fontFamily: font, package: 'text_style_editor')),
    );
  }
}
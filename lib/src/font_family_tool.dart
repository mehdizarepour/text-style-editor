import 'package:flutter/material.dart';

class FontFamilyTool extends StatelessWidget {
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
              padding: EdgeInsets.all(10),
              child: Text('Sample', style: TextStyle(fontSize: 18, fontFamily: font, package: 'text_style_editor'))
            )).toList(),
          )
        ),
      )
    );
  }
}
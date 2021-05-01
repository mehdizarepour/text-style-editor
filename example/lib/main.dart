import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextStyleEditor Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TextStyleEditor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];
  TextStyle textStyle;
  TextAlign textAlign;

  @override
  void initState() {
    textStyle =
        TextStyle(fontSize: 25, color: Colors.black, fontFamily: 'Billabong');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 350),
                width: 500,
                child: Text(
                  'Sample text',
                  style: textStyle,
                  textAlign: textAlign,
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextStyleEditor(
                      fonts: fonts,
                      textStyle: textStyle,
                      textAlign: textAlign,
                      onTextStyleEdited: (style) {
                        setState(() {
                          textStyle = textStyle.merge(style);
                        });
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

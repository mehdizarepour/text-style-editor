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
    textAlign = TextAlign.left;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Lorem ipsum dolor sit amet',
                  style: textStyle,
                  textAlign: textAlign,
                  maxLines: 10,
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
                      onTextAlignEdited: (align) {
                        setState(() {
                          textAlign = align;
                        });
                      },
                      onTextStyleEdited: (style) {
                        setState(() {
                          textStyle = textStyle.merge(style);
                        });
                      },
                      onCpasLockTaggle: (caps) {
                        print(caps);
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

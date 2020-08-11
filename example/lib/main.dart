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
  TextStyle textStyle;
  TextAlign textAlign;

  @override
  void initState() {
    textStyle = TextStyle(fontSize: 25, color: Colors.black);

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
            padding: EdgeInsets.only(top: 200),
            width: 500,
            child: Text('Sample text', style: textStyle, textAlign: textAlign),
          )),
          Expanded(
              child: SafeArea(
                  child: Container(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: TextStyleEditor(
                            height: 250,
                            textStyle: textStyle,
                            onTextStyleChange: (value) {
                              setState(() {
                                textStyle = value;
                              });
                            },
                            onTextAlignChanged: (value) {
                              setState(() {
                                textAlign = value;
                              });
                            },
                          )))))
        ],
      )),
    );
  }
}

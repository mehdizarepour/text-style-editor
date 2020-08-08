library text_style_editor;

import 'package:flutter/material.dart';

class CustomAlertBox {
  /// Bu şekilde döküman yorumları oluşturabilirsiniz kullanan kişiler için faydalı olur.
  static Future showCustomAlertBox({
    @required BuildContext context,
    @required Widget willDisplayWidget,
  }) {
    assert(context != null, "context is null!!");
    assert(willDisplayWidget != null, "willDisplayWidget is null!!");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                willDisplayWidget,
                MaterialButton(
                  color: Colors.white30,
                  child: Text('close alert'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            elevation: 10,
          );
        });
  }
}
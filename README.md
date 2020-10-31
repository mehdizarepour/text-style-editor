# TextStyleEditor

[![Version](https://img.shields.io/pub/v/text_style_editor.svg)](https://pub.dev/packages/text_style_editor)
![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

Text style editor widget for flutter

**Show some ❤️ and star the repo to support the project**

## Features

- Edit `TextStyle` object
  - font color
  - font family
  - font size
- Edit `TextAlign`

## Screenshot

![Image of Yaktocat](https://raw.githubusercontent.com/mehdizarepour/assets/master/images/text-style-editor-screenshot.gif)


## Installation

Add `text_style_editor: ^0.2.0` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:text_style_editor/text_style_editor.dart';
```

### How to add package's fonts to your project

Simply add font names with package name (`text_style_editor`) to your `pubspec.yaml` fonts.

```yaml
fonts:
  - family: Billabong
    fonts:
      - asset: packages/text_style_editor/fonts/Billabong.ttf
```

To see the list of all supported fonts, [click here](https://github.com/mehdizarepour/text_style_editor/tree/master/lib/fonts)

## How to use

Simply create a `TextStyleEditor` widget, and pass the required params:

```dart
TextStyleEditor(
  /// Optional, pass it if you have a `TextStyle` that you want to edit it.
  textStyle: defaultTextStyle,
  onTextStyleChange: (editedTextStyle) {
    setState(() {
      textStyle = editedTextStyle;
    });
  },
  onTextAlignChanged: (editedTextAlignment) {
    setState(() {
      textAlign = editedTextAlignment;
    });
  },
)
```

## Params

```dart
TextStyleEditor(
  height: 300,
  backgroundColor: Colors.white,
  primaryColor: Colors.black26,
  secondaryColor: Colors.black12,
  textStyle: defaultTextStyle,
  onTextStyleChanged: onTextStyleChangeCallBack,
  onTextAlignChanged: onTextAlignChangedCallBack,
)
```

# MIT License

```
Copyright (c) 2020 Mehdi Zarepour

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

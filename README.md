# TextStyleEditor

[![Version](https://img.shields.io/pub/v/text_style_editor.svg)](https://pub.dev/packages/text_style_editor)
![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)

Text style editor widget for flutter

**Show some ❤️ and star the repo to support the project**

## Features

- Edit `TextStyle`
- Change `TextAlign`
- Taggle `Caps lock`

## Screenshot

![editor light](https://user-images.githubusercontent.com/8446770/116907239-93193600-ac56-11eb-86b5-80eb5976a0ad.gif)
![editor dark](https://user-images.githubusercontent.com/8446770/116824956-0dd44980-aba2-11eb-8061-2ebe4cb8a7b2.gif)


## Installation

Add `text_style_editor: ^1.0.0` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:text_style_editor/text_style_editor.dart';
```

## How to use

Simply create a `TextStyleEditor` widget, and pass the required params:

**Params**

- fonts *(`List<String>`)*: List of the font families that you want to use in the Editor.
  + `required`
- textStyle *(`TextStyle`)*: The initial text style that you want to edit.
  + `required`
- textAlign *(`TextAlign`)*: The initial text align that you want to change.
  + `required`
- paletteColors *(`List<Color>`)*: List of the colors that you want to use in the Editor's palette.
  + `optional`
- onTextAlignEdited *(`Function(TextStyle)`)*: Callback will be called every time `textStyle` has changed.
  + `optional`
- onTextStyleEdited *(`Function(TextAlign)`)*: Callback will be called every time `textAlign` has changed.
  + `optional`
- onCpasLockTaggle *(`Function(bool)`)*: Callback will be called every time caps lock has changed to off or on.
  + `optional`
- onToolbarActionChanged *(`Function(EditorToolbarAction)`)*: Callback will be called every time editor's tool has changed.
  + `optional`


**Example**

```dart
TextStyleEditor(
  fonts: fonts,
  textStyle: textStyle,
  textAlign: textAlign,
  paletteColors: paletteColors,
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
    // Uppercase or lowercase letters
  },
)
```

**To see complete example: [examples](https://github.com/mehdizarepour/text_style_editor/blob/master/example/lib/main.dart)**

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

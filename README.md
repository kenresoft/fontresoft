# FontResoft

[![pub package](https://img.shields.io/pub/v/fontresoft.svg?label=fontresoft&color=blue)](https://pub.dev/packages/fontresoft)
[![pub points](https://img.shields.io/pub/points/fontresoft?logo=dart)](https://pub.dev/packages/fontresoft/score)
[![popularity](https://img.shields.io/pub/popularity/fontresoft?logo=dart&color=yellow)](https://pub.dev/packages/fontresoft/score)
[![likes](https://img.shields.io/pub/likes/fontresoft?logo=dart&color=red)](https://pub.dev/packages/fontresoft/score)
<a href="https://github.com/kenresoft/fontresoft">![Star on Github](https://img.shields.io/github/stars/kenresoft/fontresoft.svg?style=flat&logo=github&colorB=deeppink&label=stars)</a>
<a href="https://github.com/Solido/awesome-flutter">![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)</a>
<a href="https://opensource.org/license/bsd-3-clause">![License: BSD](https://img.shields.io/badge/license-BSD_3--Clause-teal.svg)</a>

FontResoft is a comprehensive Flutter font package curated to provide developers with 
a diverse selection of beautiful fonts for building visually appealing and engaging Flutter applications. 
With a wide range of font families and weights readily available, 
FontResoft simplifies the process of integrating custom typography into Flutter projects.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Examples](#examples)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use RiffSwitch in your Flutter project, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  fontresoft: ^0.0.3
```
Then, run:

```bash
flutter pub get
````

## Usage

Import the package:

```dart 
import 'package:fontresoft/fontresoft.dart';
```

An example of how to use this in the main.dart file:

```dart
ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.purpleAccent,
    fontFamily: FontResoft.poppins,
    package: FontResoft.package,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
);
```

Examples of how to use in your dart code.

```dart
Text(
  'Sample Text',
  style: Font.sourceSans().copyWith(
    fontSize: 23,
    color: color.withOpacity(1),
  ),
);
```

```dart
Text(
  Font.sourceSans().getFontName,
  style: Font.sourceSans(
    style: TextStyle(
      fontSize: 23,
      color: color.withOpacity(1),
    ),
  ),
)
```
More examples from [main.dart](example/lib/main.dart)

```dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fontresoft/fontresoft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.purpleAccent,
        fontFamily: FontResoft.poppins,
        package: FontResoft.package,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TextStyle> list = [
    Font.inconsolata(),
    Font.inter(),
    Font.lato(),
    Font.oswald(),
    Font.poppins(),
    Font.quicksand(),
    Font.robotoCondensed(),
    Font.shantellSans(),
    Font.sourceSans(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FontResoft Fonts'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var color = Color.fromRGBO(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              1,
            );
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondPage(font: list[index]),
                  ),
                );
              },
              child: Card(
                elevation: 0,
                color: color.withOpacity(0.3),
                margin: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        list[index].getFontName,
                        style: list[index].copyWith(
                          fontSize: 23,
                          color: color.withOpacity(1),
                        ),
                      ),
                      Text(
                        '${list[index].fontFamily}',
                        style: list[index].copyWith(
                          fontSize: 20,
                          color: color.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '$color',
                        style: list[index].copyWith(
                          fontSize: 16,
                          color: color.withOpacity(0.5),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

## Features

- **Diverse Font Collection**: FontResoft offers a rich assortment of font families, including 
Inconsolata, Inter, Lato, Oswald, Poppins, Quicksand, Roboto Condensed, ShantellSans, and SourceSansPro, 
each meticulously selected to cater to various design preferences and project requirements.

- **Easy Integration**: Integrating fonts from FontResoft into Flutter applications is straightforward, 
thanks to the streamlined implementation process. Developers can effortlessly access and utilize these 
fonts within their projects without the need for complex setup or configuration.

- **Multiple Weights and Styles**: Each font family in FontResoft comes with multiple weights and styles, 
empowering developers to enhance typographic diversity and achieve precise design specifications. 
Whether it's bold, italic, light, medium, or extra-bold variants, 
FontResoft offers comprehensive options to suit different design aesthetics.

- **Local Font Loading**: Fonts provided by FontResoft are locally stored within the package, 
eliminating the reliance on external networks for font retrieval. 
This ensures consistent font availability and performance across various device environments, 
without the risk of network-related issues impacting font rendering.


Currently 9 font families are defined in this library

1. [x] inconsolata
2. [x] inter
3. [x] lato
4. [x] oswald
5. [x] poppins
6. [x] quicksand
7. [x] robotoCondensed
8. [x] shantellSans
9. [x] sourceSans

## Examples


## Screenshots

<div>
  <img height="500" width="220" alt="Screenshot 1" src="https://github.com/kenresoft/fontresoft/blob/master/screenshots/Screenshot_1.png?raw=true" title="Screenshot 1">
  <p>Screenshot 1</p>
</div>

<div>
  <img height="500" width="220" alt="Screenshot 2" src="https://github.com/kenresoft/fontresoft/blob/master/screenshots/Screenshot_2.png?raw=true" title="Screenshot 2">
  <p>Screenshot 2</p>
</div>

<div>
  <img height="500" width="220" alt="Screenshot 3" src="https://github.com/kenresoft/fontresoft/blob/master/screenshots/Screenshot_3.png?raw=true" title="Screenshot 3">
  <p>Screenshot 3</p>
</div>

## Additional information

In the future, we plan to provide support for additional fonts, making it even simpler for other developers to swiftly adopt our work. 
If you think we should add other typefaces, please let us know. 
We created this package to alleviate some of the burden that developers have when it comes to organizing the fonts by weights and styles.

## Contributing

- **Issues**: If you encounter any bugs, have feature requests, or want to suggest improvements, please open an issue on our GitHub repository. Provide as much detail as possible to help us understand the problem or idea better.

- **Pull Requests**: If you'd like to contribute code changes, feel free to submit a pull request. Before doing so, make sure to fork the repository and create a new branch for your changes. Follow the existing coding style and guidelines, and write clear and concise commit messages. Your pull request will undergo review, and we'll work together to ensure the changes align with the project's goals.

- **Feature Requests**: If you have ideas for new features or enhancements, please open an issue to discuss them. We value community feedback and want to ensure that new features align with the project's direction and objectives.

- **Spread the Word**: Help us grow the FontResoft community by sharing the project with others. Whether through social media, blog posts, or word of mouth, spreading the word about FontResoft helps attract more users and contributors.

## License

This project is licensed under the BSD 3-Clause License. See the [LICENSE](LICENSE) file for details.

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

      ///debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
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
  Widget build(BuildContext context080840544) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                elevation: 0,
                color: Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1,
                ),
                margin: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(list[index].getFont, style: list[index].copyWith(fontSize: 20)),
                      Text('Sample Text', style: list[index].copyWith(fontSize: 16, fontStyle: FontStyle.italic)),
                    ],
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

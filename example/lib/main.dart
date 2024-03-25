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
    Font.sFProDisplay(),
    Font.sFProText(),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.font});

  final TextStyle font;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static const String paragraph =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Nullam vel quam ac elit consequat laoreet. Sed ac odio vel ipsum fermentum fringilla. '
      'Vivamus facilisis erat vel lacus varius, vel consectetur libero dignissim. '
      'Integer vitae lectus eu tortor congue dictum. Proin bibendum, tortor at fringilla cursus, '
      'dui justo iaculis justo, et hendrerit dui urna ac arcu. Phasellus rhoncus augue sit amet urna ultricies tincidunt. '
      'Maecenas quis sapien vel elit aliquam fermentum. Duis convallis, augue vitae aliquet mattis, metus arcu bibendum nunc, vel varius lectus odio id mauris. '
      'Vestibulum dignissim nisl ac neque dictum, nec lacinia tortor rhoncus. Nulla facilisi. '
      'Vestibulum non ipsum vitae felis eleifend scelerisque. Integer luctus, mi a laoreet convallis, '
      'orci libero tincidunt leo, ut volutpat libero turpis nec nisl. Sed malesuada metus eget felis luctus, '
      'in varius turpis facilisis. '
      'Aenean tristique eleifend sapien, eu consequat turpis commodo nec. '
      'Nam pharetra finibus ex, vel efficitur urna sollicitudin vel. Suspendisse potenti. '
      'Fusce tristique dui et est volutpat, ut feugiat odio volutpat. Phasellus vel magna et justo auctor facilisis. '
      'Pellentesque ac orci vitae ligula volutpat semper non non tortor. Etiam hendrerit mauris a quam scelerisque scelerisque. '
      'Aliquam erat volutpat. Donec vel risus sit amet nisi eleifend tincidunt. '
      'Integer eu ligula et ex malesuada interdum in a tellus. Sed auctor, velit nec facilisis consequat, '
      'dui lectus cursus elit, eu lacinia libero nulla a urna. Nam in elit at leo rhoncus euismod. '
      'Proin vitae purus nec dolor pharetra tincidunt in in urna. Duis feugiat, massa vel eleifend gravida, '
      'lacus elit feugiat sapien, sit amet cursus arcu ligula nec lectus.';

  late TextStyle style;

  @override
  void initState() {
    super.initState();
    style = widget.font.copyWith(fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.font.getFontName, style: widget.font),
          backgroundColor: Colors.black87),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 220,
              margin: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(paragraph, style: style),
              ),
            ),
            const Divider(color: Colors.white24),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    boldStyleButton(),
                    italicStyleButton(),
                    OutlinedButton(
                        onPressed: () => increaseFont(),
                        child: const Icon(Icons.plus_one)),
                    OutlinedButton(
                        onPressed: () => decreaseFont(),
                        child: const Icon(Icons.exposure_minus_1)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyleButton boldStyleButton() => style.fontWeight != FontWeight.bold
      ? OutlinedButton(
          onPressed: () => transformBold(),
          child: const Text('Bold'),
        )
      : FilledButton(
          onPressed: () => transformBold(),
          child: const Text('Bold'),
        );

  ButtonStyleButton italicStyleButton() => style.fontStyle != FontStyle.italic
      ? OutlinedButton(
          onPressed: () => transformItalic(),
          child: const Text('Italic'),
        )
      : FilledButton(
          onPressed: () => transformItalic(),
          child: const Text('Italic'),
        );

  transformBold() {
    setState(() {
      style = style.fontWeight != FontWeight.bold
          ? style.copyWith(fontWeight: FontWeight.bold)
          : style.copyWith(
              fontWeight: FontWeight.normal,
            );
    });
  }

  transformItalic() {
    setState(() {
      style = style.fontStyle != FontStyle.italic
          ? style.copyWith(fontStyle: FontStyle.italic)
          : style.copyWith(
              fontStyle: FontStyle.normal,
            );
    });
  }

  increaseFont() {
    double size = style.fontSize!;
    setState(() {
      style = style.copyWith(fontSize: size + 1);
    });
  }

  decreaseFont() {
    double size = style.fontSize!;
    setState(() {
      style = style.copyWith(fontSize: size - 1);
    });
  }
}

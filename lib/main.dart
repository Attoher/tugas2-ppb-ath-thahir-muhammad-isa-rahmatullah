import 'dart:async';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Timer hold
  Timer? _holdTimer;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _startHold() {
  _holdTimer = Timer(const Duration(milliseconds: 100), () {
    _holdTimer = Timer.periodic(const Duration(milliseconds: 250), (_) {
      _incrementCounter();
      });
    });
  }

  void _stopHold() {
    _holdTimer?.cancel();
    _holdTimer = null;
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final double screenWidth = MediaQuery.of(context).size.width;

    final double padding = screenWidth * 0.04;

    final double fontSizeBase = screenWidth * 0.04;

    final double iconSize = screenWidth * 0.08;

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.amber,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(fontSize: fontSizeBase * 1.1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          // Column adalah layout widget yang menyusun children secara vertikal.
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Menampilkan gambar berbentuk kubus (1:1)
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(padding * 0.8),
              decoration: BoxDecoration(
                color: const Color(0xFFB3E5FC),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/Beliau.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: padding * 0.75),

            // Teks "What image is that"
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: padding * 1.1,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE57373),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'What image is that',
                style: TextStyle(
                  fontSize: fontSizeBase,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: padding * 0.75),

            // Icon Food, Scenery, People
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: padding),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icon Food
                  Column(
                    children: [
                      Icon(Icons.fastfood, size: iconSize),
                      SizedBox(height: padding * 0.25),
                      Text('Food', style: TextStyle(fontSize: fontSizeBase * 0.85)),
                    ],
                  ),
                  // Icon Scenery
                  Column(
                    children: [
                      Icon(Icons.landscape, size: iconSize),
                      SizedBox(height: padding * 0.25),
                      Text('Scenery', style: TextStyle(fontSize: fontSizeBase * 0.85)),
                    ],
                  ),
                  // Icon People
                  Column(
                    children: [
                      Icon(Icons.people, size: iconSize),
                      SizedBox(height: padding * 0.25),
                      Text('People', style: TextStyle(fontSize: fontSizeBase * 0.85)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: padding * 0.75),

            // Counter dan tombol "+" dengan fitur hold
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: padding * 0.75,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFB2DFDB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Teks counter dengan tombol "+"
                  Text(
                    'Counter here: $_counter',
                    style: TextStyle(fontSize: fontSizeBase),
                  ),

                  // Deteksi tap biasa, hold mulai, dan hold selesai
                  GestureDetector(
                    // onTapDown
                    onTapDown: (_) => _startHold(),
                    // onTapUp
                    onTapUp: (_) {
                      _stopHold();
                      _incrementCounter();
                    },
                    // onTapCancel
                    onTapCancel: _stopHold,
                    child: Container(
                      width: screenWidth * 0.1,
                      height: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        color: const Color(0xFF80CBC4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: iconSize * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
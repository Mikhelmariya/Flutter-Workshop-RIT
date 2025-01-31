import 'package:flutter/material.dart';
import 'package:my_biolink/pages/my_interests.dart';
import 'package:my_biolink/pages/second_page.dart';
import 'package:my_biolink/pages/third_page.dart';

void main() {
//The runApp(MyApp()) function tells Flutter to start the application with the widget MyApp

  runApp(const MyApp());
}

// // MyApp is the main widget of the application.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides navigation, theming, and localization features.

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      // Named Routes Navigation
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: "",
            ),
        '/secondPage': (context) => SecondPage(),
        '/thirdPage': (context) => ThirdPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
    //   home: const MyHomePage(
    //       title:
    //           'Flutter Demo Home Page'), // Defines the first screen of the app
    // );
  }
}

// HomeScreen is a StatelessWidget, meaning it doesn't change its state.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // Explicitly Defines the List Type: <Widget> tells Dart that this list should only contain widgets.
          // Children property in Flutter widgets like Column, Row, and Stack must contain only Widget objects.
          // You cannot directly insert non-widget types (like int, String, or double).

          children: [
            const Text(
              'Hey ! Welcome to Flutter Workshop Day 2',
              style: TextStyle(
                fontFamily: 'Playwrite',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/secondPage',
                  arguments: "Mikhel",
                );
              },
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/duckduckgo.jpg',
                          width: 150, height: 150, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/secondPage',
                  arguments: "DuckDuckGo",
                );
              },
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/duckduckgo.jpg',
                          width: 150, height: 150, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),
            // Circular Image

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.asset('lib/assets/images/duckduckgo.jpg',
            //       width: 150, height: 150, fit: BoxFit.cover),
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // Text(
            //   "Shadowed Text",
            //   style: TextStyle(
            //     fontSize: 22,
            //     color: Colors.white,
            //     shadows: [
            //       Shadow(
            //         blurRadius: 5.0,
            //         color: Colors.black,
            //         offset: Offset(3.0, 3.0),
            //       ),
            //     ],
            //     letterSpacing: 4.0,
            //   ),
            // ),
            // Row(
            //   children: [
            //     Text(
            //       "Underlined Text",
            //       style: TextStyle(
            //         fontSize: 18,
            //         decoration: TextDecoration.underline,
            //         decorationColor: Colors.red,
            //         decorationThickness: 2.0,
            //       ),
            //     ),
            //     Spacer(),
            //     Text(
            //       "Strikethrough Text",
            //       style: TextStyle(
            //         fontSize: 18,
            //         decoration: TextDecoration.lineThrough,
            //         decorationColor: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            // Text(
            //   "Text with Background",
            //   style: TextStyle(
            //     fontSize: 20,
            //     backgroundColor: Colors.yellow,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pushes the SecondPage onto the navigation stack

                Navigator.push(
                  context,
                  // MaterialPageRoute creates a transition animation like a slide.

                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text("Go to Second Page using Push"),
            ),
            SizedBox(height: 20),
            // Navigation Using Named Routes

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/thirdPage');
              },
              child: const Text("Go to Third Page using Named Route"),
            ),
            SizedBox(height: 20),

            // Navigation Using Push Replacement

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyInterests()),
                );
              },
              child: Text('Go to Fourth Page Using Push Replacement'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

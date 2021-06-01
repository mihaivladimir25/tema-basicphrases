import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    var words = [
      "salut",
      "Hello",
      "ma numesc",
      "my name is",
      "cum esti?",
      "how are you?",
      "sunt bine",
      "i am fine"
    ];

    Future _speak(String text) async {
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text("Basic Phrases"),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          padding: const EdgeInsets.all(10.0),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: new Card(
                elevation: 5.0,
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      new EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                  child: new Text(
                    words[index],
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: Colors.blue,
              ),
              onTap: () {
                _speak(words[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

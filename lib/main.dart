import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'about_me.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let the Coin decide',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Lets Decide By Flipping a Coin'),
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
  // List _buttonPressed = [0, 1, 2];
  int _toCheckButtonPressed = 0;
  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);
  int _answer = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 18.0),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                MaterialPageRoute homeToAboutCreator = MaterialPageRoute(
                    builder: (BuildContext context) => AboutMe());
                Navigator.of(context).push(homeToAboutCreator);
              })
        ],
      ),
      body: Container(
        color: Colors.cyan.shade100,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 0.1,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Choose Heads or Tails",
                  style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Choose Wisely 😉",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amberAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "HEADS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _toCheckButtonPressed = 1;
                          _answer = next(1, 3);
                          debugPrint("${_toCheckButtonPressed}");
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TAILS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _toCheckButtonPressed = 2;
                          _answer = next(1, 3);
                          debugPrint("${_toCheckButtonPressed}");
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                if (_toCheckButtonPressed == 1)
                  Text(
                    "YOU CHOSE HEADS...",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                else if (_toCheckButtonPressed == 2)
                  Text(
                    "YOU CHOSE TAILS...",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic),
                  )
                else
                  Text(""),
                Divider(
                  thickness: 4.0,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (_toCheckButtonPressed == 1 || _toCheckButtonPressed == 2)
                  if (_answer == 1)
                    Text(
                      "THE RESULT OF THE TOSS IS HEADS",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  else if (_answer == 2)
                    Text(
                      "THE RESULT OF THE TOSS IS TAILS",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  else
                    Text(""),
                SizedBox(
                  height: 15.0,
                ),
                if (_answer == 1)
                  Image.asset("images/heads_image.jpeg")
                else if (_answer == 2)
                  Image.asset("images/tails_image.jpeg")
                else if (_answer == 5)
                  Image.asset("images/toss_image.png")
                else
                  Text(""),
                SizedBox(
                  height: 15.0,
                ),
                if (_answer == _toCheckButtonPressed)
                  Text(
                    "YOU WIN 😎",
                    style: TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  )
                else if (_answer != _toCheckButtonPressed &&
                    _answer > 0 &&
                    _answer < 3 &&
                    _toCheckButtonPressed > 0 &&
                    _toCheckButtonPressed < 3)
                  Text(
                    "YOU LOSE 😓",
                    style: TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  )
                else
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: 54.0,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

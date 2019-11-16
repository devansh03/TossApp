import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'about_me.dart';

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

  bool _buttonPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title,style: TextStyle(fontSize: 22.0),),
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
        child: Column(
            children: <Widget>[
              SizedBox(height: 15.0,),
              Text("Choose Heads or Tails",style: TextStyle(fontSize: 44.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),),
              SizedBox(height: 8.0),
              Text("Choose Wisely 😉", style: TextStyle(fontSize: 18.0),),
              SizedBox(height: 50.0,),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("HEADS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                    ),
                    onPressed: (){
                      _buttonPressed = false;

                    },
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("TAILS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),),
                    ),
                    onPressed: (){
                      _buttonPressed = true;
                    },
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}

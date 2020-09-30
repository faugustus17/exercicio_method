import 'package:exercicio_method/pages/exe1001.dart';
import 'package:exercicio_method/pages/exe1009.dart';
import 'package:exercicio_method/pages/exe1018.dart';
import 'package:exercicio_method/pages/exe2344.dart';
import 'package:exercicio_method/pages/exe3040.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
);

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercícios URI"),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("URI 1001",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exe1001(),
                    )
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            RaisedButton(
              child: Text("URI 1009",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exe1009(),
                    )
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            RaisedButton(
              child: Text("URI 1018",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exe1018(),
                    )
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            RaisedButton(
              child: Text("URI 2344",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exe2344(),
                    )
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            RaisedButton(
              child: Text("URI 3040",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              padding: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exe3040(),
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
}



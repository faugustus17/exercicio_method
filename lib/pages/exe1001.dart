import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Exe1001 extends StatefulWidget {
  @override
  _Exe1001State createState() => _Exe1001State();
}

class _Exe1001State extends State<Exe1001> {
  static const platform = const MethodChannel('JavaChannel');
  String msg = "";

  Future _actionExe1001(valorA, valorB) async{
    int result= 0;

    try{
      result = await platform.invokeMethod("exe1001",
      {
        "valorA": valorA,
        "valorB": valorB
      });
    }on PlatformException catch(e){
      print(e.message);
    }
    setState(() {
      msg = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URI 1001"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
            ),
            RaisedButton(
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 10),
              ),
              onPressed: () {
                _actionExe1001(10, 5);
              },
            ),
          ],
        ),
      ),
    );
  }
}

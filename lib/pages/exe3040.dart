import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe3040 extends StatefulWidget {
  @override
  _Exe3040State createState() => _Exe3040State();
}

class _Exe3040State extends State<Exe3040> {
  static const platform = const MethodChannel("JavaChannel");
  final _nController = TextEditingController();
  final _hController = TextEditingController();
  final _dController = TextEditingController();
  final _gController = TextEditingController();
  String msg = " ";

  Future _actionExe3040(h, d, g) async {
    String result = "";
    try{
      result = await platform.invokeMethod("exe3040",
          { "h": h,
            "d": d,
            "g": g
          }
      );
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
        title: Text("URI 3040"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Número de testes",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _nController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Altura",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _hController,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Diâmetro",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _dController,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Galhos",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _gController,
                  ),
                ],
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text(
                  "Testar",
                  style: TextStyle(fontSize: 15,
                  ),
                ),
                onPressed: () {
                  _actionExe3040(int.parse(_hController.text),
                      int.parse(_dController.text),
                      int.parse(_gController.text));
                },
              ),
            ],

          ),
      ),
    );
  }
}

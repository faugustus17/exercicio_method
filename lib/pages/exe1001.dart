import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe1001 extends StatefulWidget {
  @override
  _Exe1001State createState() => _Exe1001State();
}

class _Exe1001State extends State<Exe1001> {
  static const platform = const MethodChannel('JavaChannel');
  String msg = "0";

  final _valorAController = TextEditingController();
  final _valorBController = TextEditingController();

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

  void _clear(){
    _valorAController.clear();
    _valorBController.clear();
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Insira o primeiro valor",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: _valorAController,
              autofocus: true,
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Insira o segundo valor",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: _valorBController,
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Resultado: ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              msg,
              style: TextStyle(fontSize: 30,
                  color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            RaisedButton(
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 15,
                ),
              ),
              onPressed: () {
                _actionExe1001(int.parse(_valorAController.text), int.parse(_valorBController.text));
                _clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

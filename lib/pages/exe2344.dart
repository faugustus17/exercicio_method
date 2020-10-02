import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe2344 extends StatefulWidget {
  @override
  _Exe2344State createState() => _Exe2344State();
}

class _Exe2344State extends State<Exe2344> {
  static const platform = const MethodChannel('JavaChannel');
  String msg = "0";

  final _notaController = TextEditingController();

  Future _actionExe1001(nota) async{
    String result= "Conceito";

    try{
      result = await platform.invokeMethod("exe2344",
          {
            "nota": nota
          });
    }on PlatformException catch(e){
      print(e.message);
    }
    setState(() {
      msg = result;
    });
  }

  void _clear(){
    _notaController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URI 2344"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Informe a nota",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: _notaController,
              autofocus: true,
            ),
            SizedBox(
              height: 15.0,
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
                "Verificar",
                style: TextStyle(fontSize: 15,
                ),
              ),
              onPressed: () {
                _actionExe1001(_notaController.text);
                //_clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

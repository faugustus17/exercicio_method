import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe1018 extends StatefulWidget {
  @override
  _Exe1018State createState() => _Exe1018State();
}

class _Exe1018State extends State<Exe1018> {
  static const platform = const MethodChannel('JavaChannel');
  int count= 0;
  List<dynamic> result;
  final _valorNotaController = TextEditingController();

  Future _actionExe1018(valorNota) async{
    try{
      result = await platform.invokeMethod("exe1018",
          {
            "valorNota": valorNota
          });
    }on PlatformException catch(e){
      print(e.message);
    }
    setState(() {
      count = result.length;
    });
  }

  void _clear(){
    _valorNotaController.clear();
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
                labelText: "Valor",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: _valorNotaController,
              autofocus: true,
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(
                        '${result[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            RaisedButton(
              child: Text(
                "Calcular Notas",
                style: TextStyle(fontSize: 15,
                ),
              ),
              onPressed: () {
                _actionExe1018(int.parse(_valorNotaController.text));
                _clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exe1009 extends StatefulWidget {
  @override
  _Exe1009State createState() => _Exe1009State();
}

class _Exe1009State extends State<Exe1009> {
  static const platform = const MethodChannel('JavaChannel');
  String msg = "0";
  final _nomeController = TextEditingController();
  final _salarioController = TextEditingController();
  final _vendasController = TextEditingController();

  Future _actionExe1001(salario, vendas) async{
    double result= 0;

    try{
      result = await platform.invokeMethod("exe1009",
          {
            "salario": salario,
            "vendas": vendas
          });
    }on PlatformException catch(e){
      print(e.message);
    }
    setState(() {
      msg = result.toString();
    });
  }

  void _clear(){
    _nomeController.clear();
    _salarioController.clear();
    _vendasController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URI 1009"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe o nome",
                  border: OutlineInputBorder(),
                ),
                controller: _nomeController,
                keyboardType: TextInputType.text,
                autofocus: true,
              )),
              SizedBox(
                height: 5.0,
              ),
              Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Salário",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _salarioController,
              )),
              SizedBox(
                height: 5.0,
              ),
              Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Vendas",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                controller: _vendasController,
              )),
              SizedBox(
                height: 10.0,
              ),
              Container(
              child: Text(
                "Total: ",
                style: TextStyle(fontSize: 20),
              )),
              /*SizedBox(
                height: 10.0,
              ),*/
              Container(
              child: Text(
                msg,
                style: TextStyle(fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                ),
              )),
              /*SizedBox(
                height: 35.0,
              ),*/

            RaisedButton(
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 15,
                ),
              ),
              onPressed: () {
                _actionExe1001(double.parse(_salarioController.text), double.parse(_vendasController.text));
                _clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

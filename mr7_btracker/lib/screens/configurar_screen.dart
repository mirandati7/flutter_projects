import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/io_client.dart';

class ConfigurarScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurar"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: "IP Servidor:Porta"
              ),
              validator: (text){
                if (text.isEmpty) return "IP Inválido";
              },
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text("Configurar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _salvar();
                  }

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


_salvar() async {

  /*
  String url = "https://187.32.49.76/";

  http.Response response;

  var corpo = json.encode({
    "status": "ATIVO",
    "email": "email@email.com",
    "nome": "mr7",
    "senha": "123456",
    "cnpj": "00.000.000/0000-00",
    "banco": "12345678900",
    "funcao": "gravar",
    "colecao": "usuarios",
    "user": "mr7",
    "pass": "123"
  });


  bool trustSelfSigned = true;
  HttpClient httpClient = new HttpClient()
    ..badCertificateCallback =
    ((X509Certificate cert, String host, int port) => trustSelfSigned);
  IOClient ioClient = new IOClient(httpClient);


  response = await ioClient.post(url,
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo);


  print(
      "Resposta Usuarios : ${response.body} "
  );
    */

}
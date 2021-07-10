import 'package:flutter/material.dart';
import 'package:btracker/util/leitor_code.dart';
import 'package:btracker/screens/configurar_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:http/io_client.dart';

class LoginScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login  "),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Configurar",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>ConfigurarScreen())
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Usuário"
              ),
              keyboardType:  TextInputType.emailAddress,
              validator: (text){
                if (text.isEmpty || !text.contains("@")) return "E-mail inválido";
              },
            ),
            SizedBox(height: 16.0,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Senha"
              ),
              obscureText: true,
              validator: (text){
                if (text.isEmpty || text.length < 6) return "Senha inválida";
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: (){},
                child: Text("Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                child: Text("Entrar",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context)=>LeitorCode())
                    );
                  }

                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _salvar(String barCode) async {

    String url = "https://187.32.49.76/login";

    //http.Response response;

    print(barCode);

    //'2020-03-14 03:00:00-' and '2020-03-14 03:59:59'

    var corpo = json.encode({
      "usuario": "email@email.com",
      "senha": "123456",
      "dispositivo": "122345"
    });

    /*

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
    */

    print(
        "Resposta Usuarios : ${corpo} "
    );
  }
}

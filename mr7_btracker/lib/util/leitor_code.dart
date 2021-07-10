import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
//import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:http/io_client.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(LeitorCode());

class LeitorCode extends StatefulWidget {
  @override
  _LeitorCodeState createState() => _LeitorCodeState();
}

class _LeitorCodeState extends State<LeitorCode> {
  String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        "#ff6666", "Cancel", true, ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      _salvar(_scanBarcode);
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      _salvar(_scanBarcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Coletor de Dados')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => scanBarcodeNormal(),
                            child: Text("Leitor Codigo Barra")),
                        /*
                        RaisedButton(
                            onPressed: () => scanQR(),
                            child: Text("Leitor QR Code")),
                        RaisedButton(
                            onPressed: () => startBarcodeScanStream(),
                            child: Text("Leitor Codigo de Barra Contínuo ")),
                        */
                        Text('Resultado : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }



  _salvar(String barCode) async {
    /*

    String url = "https://187.32.49.76/triagem";

    http.Response response;

    print(barCode);

    //'2020-03-14 03:00:00-' and '2020-03-14 03:59:59'

    var corpo = json.encode({
      "usuario": "email@email.com",
      "codigoBarras": barCode.toString()
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


}
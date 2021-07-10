import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", true,ScanMode.BARCODE)
        .listen((barcode) => print(barcode));
  }

  Future<void> initPlatformState() async {
    String barcodeScanRes;
    try {
      barcodeScanRes =
      await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true,ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () {
                              initPlatformState();
                            },
                            child: Text("Start barcode scan")),
                        Text('Scan result : $_scanBarcode\n',
                            style: TextStyle(fontSize: 20)),
                        RaisedButton(
                            onPressed: () {
                              startBarcodeScanStream();
                            },
                            child: Text("Start barcode scan stream"))
                      ]));
            })));
  }
}
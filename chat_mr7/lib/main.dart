import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {

  Firestore.instance.collection("teste").document("teste").setData({"teste" : "teste"});

  runApp(Home());


}


class Home extends StatelessWidget {
  @@override
  Widget build(BuildContext context) {
    return Container();
  }
}



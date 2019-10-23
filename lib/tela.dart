import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  Tela({Key key}) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: GestureDetector(
            key: Key("telakey"),
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Nova Tela"),
          ),
        ));
  }
}

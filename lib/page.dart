import 'package:flutter/material.dart';
import 'package:test_view/tela.dart';

class Page extends StatefulWidget {
  Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        child: PageView(
          key: Key("pageview"),
          children: <Widget>[
            page1(),
            page2(),
            page3(),
          ],
        ),
      ),
    );
  }

  Widget page1() {
    return Container(
      color: Colors.blue,
      child: GestureDetector(
        key: Key("pagekey"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Tela()));
        },
        child: Text("Page1"),),
    );
  }

  Widget page2() {
    return Container(
      color: Colors.green,
      child: Text("Page2"),
    );
  }

  Widget page3() {
    return Container(
      color: Colors.yellow,
      child: Text("Page3"),
    );
  }
}

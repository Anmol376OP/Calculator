import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("Helikopter Calculator"),
        ),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(),
          ],
        ),

      )
    );
  }
}
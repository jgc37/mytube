import 'package:flutter/material.dart';
import 'ui/home.dart';
main() => runApp(new app());

class app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "myTube",
      home: new Home(),
    );
  }
}
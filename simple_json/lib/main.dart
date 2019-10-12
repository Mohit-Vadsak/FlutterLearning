import 'package:flutter/material.dart';
import 'package:simple_json/student_services.dart';

void main() {
  runApp(new MyApp());
  loadStudent();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body : Text("Hello world"),
    );
  }
}
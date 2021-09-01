import 'package:flutter/material.dart';
import 'package:vistas/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      title: 'Material App',
      home: HomePage(),
    );
  }
}
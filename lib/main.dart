import 'package:flutter/material.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Max Fitnes',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

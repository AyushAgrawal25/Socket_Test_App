import 'package:flutter/material.dart';

class SocketTestPage extends StatefulWidget {
  @override
  _SocketTestPageState createState() => _SocketTestPageState();
}

class _SocketTestPageState extends State<SocketTestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Socket Testing",
            textScaleFactor: 1.0,
          ),
          backgroundColor: Colors.green.shade700,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}

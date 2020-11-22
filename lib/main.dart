import 'package:Socket_Test_App/ControllerTest.dart';
import 'package:Socket_Test_App/SocketUtils.dart';
import 'package:Socket_Test_App/StateManagement/Models/AppState.dart';
import 'package:Socket_Test_App/UserInterface/Pages/UserDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) {
      return AppState();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserDetailsPage(),
    );
  }
}

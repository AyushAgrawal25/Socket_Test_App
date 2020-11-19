import 'package:Socket_Test_App/ControllerTest.dart';
import 'package:Socket_Test_App/SocketUtils.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MyApp());
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Calling Init Function Of Socket Utils
    IO.Socket gpSocket = SocketUtils().init();
    gpSocket.on("connect", (data) {
      popUpFun();
    });
  }

  popUpFun() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Socket Connected",
                  style: TextStyle(
                      fontSize: 25, color: Color.fromRGBO(50, 50, 50, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  "Calling Pop Up Function On Connect Event",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromRGBO(50, 50, 50, 1)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TestAppController testAppController;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press To Connect.',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              child: TestApp(
                getController: (testCont) {
                  testAppController = testCont;
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          status = !status;
          testAppController.toggle(status);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

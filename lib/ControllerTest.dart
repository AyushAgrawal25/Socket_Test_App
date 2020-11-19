import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  Function(TestAppController) getController;
  TestApp({@required this.getController});
  @override
  _TestAppState createState() => _TestAppState();
}

class TestAppController {
  Function(bool) toggle;
  TestAppController(Function(bool) togFun) {
    toggle = togFun;
  }
}

class _TestAppState extends State<TestApp> {
  @override
  void initState() {
    super.initState();
    TestAppController controller = TestAppController(testAppFun);
    widget.getController(controller);
  }

  testAppFun(bool st) {
    if (st) {
      status = "Activated";
    } else {
      status = "Deactivated";
    }

    setState(() {});
  }

  String status = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        status,
        style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),
      ),
    );
  }
}

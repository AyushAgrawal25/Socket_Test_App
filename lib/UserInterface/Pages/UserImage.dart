import 'package:Socket_Test_App/BussinessLogic/UserUtils.dart';
import 'package:Socket_Test_App/StateManagement/Models/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserImage extends StatefulWidget {
  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    AppState gpAppStateListen = Provider.of<AppState>(context);
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: InteractiveViewer(
        child: Image.network(
          domainName + gpAppStateListen.userDetails.profilePicUrl,
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    ));
  }
}

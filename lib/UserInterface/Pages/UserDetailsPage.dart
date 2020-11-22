import 'package:Socket_Test_App/BussinessLogic/UserUtils.dart';
import 'package:Socket_Test_App/StateManagement/Models/AppState.dart';
import 'package:Socket_Test_App/StateManagement/Models/UserDetails.dart';
import 'package:Socket_Test_App/UserInterface/Pages/UserImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gpAppState = Provider.of<AppState>(context, listen: false);
  }

  AppState gpAppState;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    AppState gpAppStateListen = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Details",
          textScaleFactor: 1.0,
        ),
        backgroundColor: Colors.green.shade700,
      ),
      body: Stack(
        children: [
          Container(
            child: (gpAppStateListen.userDetails != null)
                ? Container(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return UserImage();
                                },
                              ));
                            },
                            child: Image.network(
                              domainName +
                                  gpAppStateListen.userDetails.profilePicUrl,
                              height: MediaQuery.of(context).size.width * 0.75,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            gpAppStateListen.userDetails.firstName.trim() +
                                " " +
                                gpAppStateListen.userDetails.lastName.trim(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Email : " +
                                gpAppStateListen.userDetails.email.trim(),
                            style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Text(
                        "Fetch",
                        style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade400),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        UserDetails tmp = await UserUtils.fetchUserDetails(
                            13, "ekjfeywgfyewvhjbysgvdybvbsdh");
                        gpAppStateListen.setUserDetails(tmp);
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  ),
          ),
          (isLoading)
              ? Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fwatery/routes/route_name.dart';

//import 'dart:async';
class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Account Setting",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, settingPageRoute);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child:
        PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(left: 15, top: 30, right: 15),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "New E-mail",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "New Phone Number",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "New password",
                      labelStyle: TextStyle(
                        color: Colors.orangeAccent[100],
                        fontSize: 15,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "repeat password",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  height: 40,                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child:
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {

                    },
                    child: Text("Edit",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.orangeAccent)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 250,
                  height: 40,                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child:
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {

                    },
                    child: Text("Save",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.orangeAccent)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),);
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fwatery/routes/route_name.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Fwatery",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 40, left: 40, right: 40,),

          children: <Widget>[
            Image(image: AssetImage('assets/logo2.png'),),
            Column(
              children: <Widget>[
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
                      Navigator.pushNamed(context, loginPageRoute);
                    },
                    child: Text("Log In",
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
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child:
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, signupPageRoute);
                    },
                    child: Text("Create Account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.orangeAccent)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

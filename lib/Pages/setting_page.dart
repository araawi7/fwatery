import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwatery/routes/route_name.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.language),
              color: Colors.white,
              onPressed: () {}),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [

            SizedBox(
              height: 60,
            ),
            buildAccountOptionRow1(context, "QA & Contact Us "),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow2(context, "About Us"),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 250,
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, firstPageRoute);
                },
                child: Text("SING OUT",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        color: Colors.orangeAccent)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildAccountOptionRow1(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, contactPageRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.question_answer_outlined,
                  color: Colors.orangeAccent[100],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orangeAccent[100],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.orangeAccent[100],
            )
          ],
        ),
      ),
    );
  }

  buildAccountOptionRow2(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, aboutPageRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(
                  Icons.device_unknown,
                  color: Colors.orangeAccent[100],
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orangeAccent[100],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.orangeAccent[100],
            )
          ],
        ),
      ),
    );
  }
}

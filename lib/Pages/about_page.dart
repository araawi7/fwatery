import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}
class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "About Us ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body:
      PageView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom:200,),
            child: Center(

              child: Text(
                  " We Are Five Computer Since Student "
                      "\n From King Khalid University "
                      "\n And This App Is Our Graduation Project",
                  style: TextStyle(color: Colors.grey, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}

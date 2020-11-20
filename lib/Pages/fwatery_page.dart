import 'package:flutter/material.dart';


class FoaterPage extends StatefulWidget {
 
  @override
  _FoaterPageState createState() => _FoaterPageState();
}

class _FoaterPageState extends State<FoaterPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('Not Found Page'),
          backgroundColor: Colors.orangeAccent
      ),
    );
  }

  }



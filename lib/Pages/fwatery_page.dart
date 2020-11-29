import 'package:flutter/material.dart';

class FoaterPage extends StatefulWidget {
  final String url;

  const FoaterPage({Key key, @required this.url}) : super(key: key);
  @override
  _FoaterPageState createState() => _FoaterPageState(url);
}

class _FoaterPageState extends State<FoaterPage> {
  final String url;

  _FoaterPageState(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Fwatery'), backgroundColor: Colors.orangeAccent),
        body: SafeArea(
          child: Center(
              child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          )),
        ));
  }
}

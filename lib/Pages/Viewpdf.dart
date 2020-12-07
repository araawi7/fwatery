import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_share/flutter_share.dart';
class Viewpdf extends StatefulWidget {
  final String url;

  const Viewpdf({Key key, this.url}) : super(key: key);

  @override
  _ViewpdfState createState() => _ViewpdfState(url);
}

class _ViewpdfState extends State<Viewpdf> {
  final String url;

  _ViewpdfState(this.url);

  @override
  Widget build(BuildContext context) {
    String data=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.share),
              onPressed: share),
        ],


        backgroundColor: Colors.orangeAccent,
        title: Text("Fwatery"),
      ),
      body:PDF().cachedFromUrl(data),
    );
  }
Future<void> share() async {
  await FlutterShare.share(
      title: 'PDF', linkUrl: url, chooserTitle: 'Where You Want to Share');
}
}

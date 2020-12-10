//the page will call pdf method
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_share/flutter_share.dart';

class PdfViewUrl extends StatefulWidget {
  final String url;

  const PdfViewUrl({Key key, @required this.url}) : super(key: key);
  @override
  _PdfViewUrlState createState() => _PdfViewUrlState(url);
}

class _PdfViewUrlState extends State<PdfViewUrl> {
  final String url;

  _PdfViewUrlState(this.url);
  // ignore: deprecated_member_use
  final firestoreinstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: share),],
        title: Text(
          "Fwatery",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: PDF().cachedFromUrl(url),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          child: Icon(
            Icons.my_library_add,
            color: Colors.white,
          ),
          onPressed: () {
            FirebaseAuth auth = FirebaseAuth.instance;

            firestoreinstance.collection("Users").doc(auth.currentUser.uid).collection("PDFs").add({
              "PdfName": "PDF",
              "PdfLink": url,
            }).then((value) {
              print(value.id);
            });
          }),
    );
  }



  Future<void> share() async {
    await FlutterShare.share(
        title: 'PDF', linkUrl: url, chooserTitle: 'Where You Want to Share');
  }
}

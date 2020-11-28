import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
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
        appBar:AppBar(
            title: Text('Fwatery'),
            backgroundColor: Colors.orangeAccent
        ),
        body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Pdf").snapshots(),
          builder: (context, snapshots) {
            if(snapshots.data == null) return CircularProgressIndicator();

            return ListView.builder(
                itemCount: snapshots.data.documents.length,
                itemBuilder:(context, index){
                  DocumentSnapshot pdf= snapshots.data.documents[index];
                  return ListTile(

                    leading:PDF().cachedFromUrl(url),
                    title: Text(pdf["name"]),
                  );
                }


            );

          })
    );
  }}

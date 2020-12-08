import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fwatery/Pages/Viewpdf.dart';

class FoaterPage extends StatefulWidget {
  final String url;

  const FoaterPage({Key key, @required this.url}) : super(key: key);
  @override
  _FoaterPageState createState() => _FoaterPageState(url);
}

class _FoaterPageState extends State<FoaterPage> {
  final String url;
  _FoaterPageState(this.url);
  //List<Modal> itemlist = List();

  final mainReference = FirebaseDatabase.instance.reference().child("Database");
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(        automaticallyImplyLeading: false,

              title: Text('Fwatery'), backgroundColor: Colors.orangeAccent),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").doc(auth.currentUser.uid).collection("PDFs").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ));
            } else {
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Container(
                        width: 400,
                        height: 90,
                        child: Card(
                          child: GestureDetector(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        100, 40, 100, 0),
                                    child: Text(
                                      document["PdfName"],
                                      style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Viewpdf(),
                                        settings: RouteSettings(
                                            arguments: document["PdfLink"])));
                              }),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}

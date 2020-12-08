//the page will call pdf method
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfViewUrl extends StatefulWidget {
  final String url;

  const PdfViewUrl({Key key, @required this.url}) : super(key: key);
  @override
  _PdfViewUrlState createState() => _PdfViewUrlState(url);
}

class _PdfViewUrlState extends State<PdfViewUrl> {
  final String url;
  var dio = Dio();

  _PdfViewUrlState(this.url);
  // ignore: deprecated_member_use
  final firestoreinstance = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: share),
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () async {
              String path = await ExtStorage.getExternalStoragePublicDirectory(
                  ExtStorage.DIRECTORY_DOWNLOADS);
              String fullPath = "$path/.pdf";
              download2(dio, url, fullPath);
            },
          ),
        ],
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

  @override
// ignore: must_call_super
  void initState() {
    getPermission();
  }

  void getPermission() async {
    print("    get Permission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(Dio dio, String url, String savePath) async {
    //get pdf from link
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      //write in download folder
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print("error");
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'PDF', linkUrl: url, chooserTitle: 'Where You Want to Share');
  }
}

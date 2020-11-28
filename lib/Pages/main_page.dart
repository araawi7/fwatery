import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fwatery/Pages/setting_page.dart';
import 'package:fwatery/routes/route_name.dart';
import 'fwatery_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String result = "";
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      Navigator.pushNamed(context, pdfUrlPageRoute, arguments: qrResult);
      // setState(() {
      //   result = qrResult;
      // });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  PageController _pageController = PageController();
  List<Widget> _screens = [PdfViewUrl(url: "result"), SettingsPage()];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf,
                color: _selectedIndex == 0 ? Colors.orangeAccent : Colors.grey),
            // ignore: deprecated_member_use
            title: Text(
              'Foater',
              style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey),
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: _selectedIndex == 1 ? Colors.orangeAccent : Colors.grey),
            // ignore: deprecated_member_use
            title: Text(
              'Setting',
              style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey),
            ),
            backgroundColor: Colors.white,
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.orangeAccent,
        onPressed: _scanQR ) // popped from LoginScreen().

      );

  }
}

/*BottomNavigationBarItem(
icon: Icon(Icons.qr_code_scanner_rounded,
color: _selectedIndex == 1 ? Colors.orangeAccent : Colors.grey),
title: Text(
'scan',
style: TextStyle(
color: _selectedIndex == 1 ? Colors.black : Colors.grey),
),
backgroundColor: Colors.white,
),*/

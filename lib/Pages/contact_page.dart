import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Contact & QA ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListView(

            padding: EdgeInsets.only(left: 15, top:30, right: 15),

            children: <Widget>[
              Text(
                  " 1. Does a photocopy of an invoice stored in the application substitute the original invoice ?",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              Text("\n  It depends on the trader's policy.",
                  style: TextStyle(color: Colors.grey[500],fontSize: 20)),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Text(
                  "\n 2. Is there a maximum limit to the number of invoices ? ",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              Text('\n No.', style: TextStyle(color: Colors.grey[500],fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Text(
                  "\n 3. Are my personal data safe? Are they shared with any third parties ?",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              Text(
                  '\n Of course, they are safe. CPA is keen not to share your data with any third parties.',
                  style: TextStyle(color: Colors.grey[500],fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Text(
                  "\n 4. Are the invoice's data entered automatically after scan it ?",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              Text(' \n Yes.', style: TextStyle(color: Colors.grey[500],fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Text("\n Contact us through mail...",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20)),
              Text('\n foater@gmail.com',
                  style: TextStyle(color: Colors.grey[500],fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Container(padding: EdgeInsets.all(20), child: Text(''))
            ],
          ),
        ],
      ),



    );
  }
}

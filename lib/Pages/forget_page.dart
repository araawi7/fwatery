import 'package:flutter/material.dart';
import 'package:fwatery/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPage extends StatefulWidget {
  ForgetPage({Key key}) : super(key: key);

  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _emailController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forget Password ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Email';
                    } else {
                      _emailController = value;
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: Colors.orangeAccent[100],
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _emailController)
                            .then(
                              (value) =>
                                  Navigator.pushNamed(context, loginPageRoute),
                            );
                      }
                    },
                    child: Text("Next",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.orangeAccent)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fwatery/routes/route_name.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: PageView(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter valid Email';
                        return null;
                      },
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "something@example.com",
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "password",
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, forgetPageRoute);
                          },
                          child: Text("Forget Password",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.orangeAccent)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      child: OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Log in",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                                color: Colors.orangeAccent)),
                        onPressed: () async {if (
                        _formKey.currentState.validate()) {
                          _signInWithEmailAndPassword();
                        }},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return MainPage();
      }));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }


}

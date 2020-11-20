import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fwatery/Pages/login_page.dart';
import 'package:fwatery/Pages/main_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<SignupPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  bool _isSuccess;
  String _userEmail;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Create Account",
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
                      controller: _username,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter User Name';
                        }
                        return null;
                      },
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Fatima Ali",
                        labelText: "Name",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
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
                      controller: _passwordController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      obscureText: true,
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
                    TextFormField(
                      obscureText: true,
                      controller: _repasswordController,
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
                        labelText: "Re-enter Password",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
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
                        child: Text("Create",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 2.2,
                                color: Colors.orangeAccent)),

                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _registerAccount();
                          }
                        },
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

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _username.text);
      final user1 = _auth.currentUser;
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      _isSuccess = false;
    }
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fwatery/Pages/main_page.dart';
import 'package:fwatery/services/database.dart';

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
  String _error;//added by mona
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
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Create Account",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              showAlert(),
                              SizedBox(height: _height * 0.025),
                              TextFormField(
                                controller: _username,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'user name can not be empty';
                                  }
                                  if (value.length<3) {
                                    return 'the name must be at lest 3 letter ';
                                  }
                                  return null;
                                },
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
                                  if (value.isEmpty){
                                    return 'email can not be empty!';
                                  }
                                  if (!value.contains("@")){
                                    return 'Please enter valid Email like:something@example.com';
                                  }
                                  return null;
                                },
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
                                  if (value.isEmpty){
                                    return 'password can not be empty!';
                                  }
                                  if (value.length<8){
                                    return 'password length must be 8 or more digit';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                cursorColor: Colors.black,
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
                                controller: _repasswordController,
                                validator: (String value) {
                                  if (value.isEmpty){
                                    return 'password can not be empty!';
                                  }
                                  if (value.compareTo(_passwordController.text) != 0){
                                    return 'password not match!';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: TextStyle(
                                  color: Colors.black,
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
                              SizedBox(height: 20,),
                              Container(
                                width: 260,
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 90),
                                child: OutlineButton(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Text("Create",
                                      style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 2.0,
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
                      ]),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.grey,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
  void _registerAccount() async {
    try{
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,password: _passwordController.text,)).user;

      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();}
        await user.updateProfile(displayName: _username.text);
        final user1 = _auth.currentUser;
        userSetup(_username.text, _emailController.text);      // THIS LINE TO ADD A NEW USER RECORD
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        _isSuccess = false;
      }
    }
    catch (e) {
      print(e);
      setState(() {
        _error = e.message;
      });
    }
  }}

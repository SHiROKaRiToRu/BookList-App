import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/widget/form_container_widget.dart';
import 'package:flutter_project/services/auth.dart';
import 'package:flutter_project/services/toast.dart';

import '../models/currentUser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();

}
  class _LoginPageState extends State<Login> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/welcome.jpg',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          ),
          // Centered login form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo (optional)
                  Image.asset(
                    'assets/Book_List_logo.png',
                    height: 250,
                    width: 250,
                  ),
                  SizedBox(height: 30),
                  // Login form
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Title
                          Text(

                        "Login",
                        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                          // Login Button
                          ElevatedButton(
                            onPressed: () {
                              _signIn();// After successful login

                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                               // Define primary color here
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _signIn() async {
    /*setState(() {
      _isSigning = true;
    });*/

    String email = _emailController.text;
    String password = _passwordController.text;

    String? uid = await _auth.signInWithEmailAndPassword(email, password);
    UserSingleton.instance.uid = uid;

    if (uid != null) {
      showToast(message: "User is successfully signed in");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showToast(message: "some error occured");
    }
  }



}

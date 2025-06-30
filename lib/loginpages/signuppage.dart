import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/widget/form_container_widget.dart';
import 'package:flutter_project/services/auth.dart';
import 'package:flutter_project/services/toast.dart';


import '../models/currentUser.dart';


class SignUpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SignUpPageState();

}
  class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
          // Centered sign up form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(
                'assets/Book_List_logo.png',
                height: 250,
                width: 250,),
                  SizedBox(height: 30),
                  // Sign up form
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
                        const Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FormContainerWidget(
                        controller: _usernameController,
                        hintText: "Username",
                        isPasswordField: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                      ),
                      const SizedBox(
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
                          // Sign Up Button
                          ElevatedButton(
                            onPressed: ()  {
                              _signUp();// Implement sign up functionality
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                               // Define primary color here
                            ),
                            child: const Text(
                              'Sign Up',
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

  void _signUp() async {

    //BookDetailsPage add = BookDetailsPage(book: {},);

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    String? uid = await _auth.singUpWithEmailAndPassword(email, password);
    UserSingleton.instance.uid = uid;
    CollectionReference collRef = FirebaseFirestore.instance.collection("users");
    collRef.doc(uid).set({
      'user_email': email,
      'user_name': username,
      'user_password': password,
      'created_time': DateTime.now(),
    });



    if (uid != null) {
      showToast(message: "User is successfully created");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()));

    } else {
      showToast(message: "Some error happend");
    }
  }
}

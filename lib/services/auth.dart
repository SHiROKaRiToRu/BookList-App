import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;


  Future<String?> singUpWithEmailAndPassword(String email, String password) async {

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      String uid = user!.uid;
      return uid;
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<String?> signInWithEmailAndPassword(String email, String password) async {

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = credential.user;
      String uid = user!.uid;
      return uid;
    }catch(e){
      print(e);
    }
  }


}
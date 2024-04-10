import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newspace/usecase/on_google_login.dart';

class EntryController extends GetxController{

  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  initiateLogin(){
    OnGoogleLogin(googleSignIn: googleSignIn, auth: auth);
  }
  
}
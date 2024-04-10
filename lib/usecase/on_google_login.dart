import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newspace/components/show_snackbar.dart';
import 'package:newspace/main.dart';
import 'package:newspace/usecase/update_lastUID.dart';
import 'package:newspace/utils/execute.dart';
import 'package:newspace/usecase/save_user_data_to_local.dart';
import 'package:newspace/views/home/home_view.dart';
import 'package:newspace/usecase/fetch_user_data_from_remote.dart';

class OnGoogleLogin extends Execute {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;

  OnGoogleLogin({required this.googleSignIn, required this.auth, super.instance = 'OnGoogleLogin'}){
    execute();
  }

  @override
  execute() async {
    await executeWithCatchError(super.instance);
  }

  @override
  executeWithCatchError(String instance) async {
    logYellow("onGoogleLogin");
    ShowSnackBar(
      title: "Logging In...", 
      message: "You are logging in via Google account. Please wait", 
      duration: const Duration(minutes: 1)
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn().timeout(
      const Duration(seconds: 55),
      onTimeout: () {
        logRed("onGoogleLogin: Timeout");
        ShowSnackBar(
          title: "Timeout",
          message: "Something went wrong. Please try again",
          duration: const Duration(seconds: 3)
        );
        return null;
      },
    );
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication.timeout(
      const Duration(seconds: 55),
      onTimeout: () {
        logRed("onGoogleLogin: Timeout");
        ShowSnackBar(
          title: "Timeout",
          message: "Something went wrong. Please try again",
          duration: const Duration(seconds: 3)
        );
        return googleUser.authentication;
      },
    );
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential = await auth.signInWithCredential(credential);

    final User user = userCredential.user!;
    final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;

    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    if (isNewUser) {
      await users.doc(user.uid).set({
        'name': user.displayName!,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
        'lastLoginAt': FieldValue.serverTimestamp(),
        'deviceToken': deviceToken.value
      });

      RecalibrateUserData(user: user);

      UpdateLastUID(id: user.uid);
      if(Get.isSnackbarOpen) Get.back();

      Get.off(()=>const HomeView());
    } else {
      await users.doc(user.uid).update({
        'lastLoginAt': FieldValue.serverTimestamp(),
        'deviceToken': deviceToken.value
      });
      RecalibrateUserData(user: user);

      userData.value.deviceToken = deviceToken.value;
      userData.value.lastLoginAt = Timestamp.now();

      SaveUserDataToLocal(id: user.uid, userData: userData);

      UpdateLastUID(id: user.uid);
      if(Get.isSnackbarOpen) Get.back();

      Get.offAll(()=>const HomeView());
    }
  }
}
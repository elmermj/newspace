import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/user_account_model.dart';
import 'package:newspace/utils/execute.dart';
import 'package:newspace/usecase/save_user_data_to_local.dart';

class RecalibrateUserData extends Execute {
  final User user;
  
  RecalibrateUserData({required this.user, super.instance = 'RecalibrateUserData'}){
    execute();
  }

  @override
  execute() async {
    await executeWithCatchError(super.instance);
  }

  @override
  executeWithCatchError(String instance) async {
    logYellow("recalibrating user data from remote (firestore)...");
    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(user.uid).get().then((DocumentSnapshot doc) async {
      final data = doc.data() as Map<String,dynamic>;
      final temp = UserAccountModel(
        name: data['name'] as String?,
        email: data['email'] as String?,
        lastLoginAt: data['lastLoginAt'] as Timestamp?,
        dob: data['dob'] as String?,
        profileDesc: data['profileDesc'] as String?,
        photoUrl: data['photoUrl'] as String?,
        interests: data['interests'] as String?,
        city: data['city'] as String?,
        currentCompany: data['currentCompany'] as String?,
        occupation: data['occupation'] as String?,
        userSettings: data['userSettings'] as Map<String, dynamic>?,
        followers: data['followers'] as int?,
        deviceToken: data['deviceToken'] as String?,
        createdAt: data['createdAt'] as Timestamp?,
      );

      userData.value = temp;

      SaveUserDataToLocal(id: user.uid, userData: userData);
    });
  }
}
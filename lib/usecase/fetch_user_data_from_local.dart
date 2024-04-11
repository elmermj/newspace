import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/user_account_model.dart';
import 'package:newspace/utils/execute.dart';

class FetchUserDataFromLocal extends Execute{
  final User user;

  FetchUserDataFromLocal({required this.user, super.instance = 'FetchDataFromLocal'});

  @override
  execute() async {
    logYellow("fetching user data from local...");
    final userDataBox = await Hive.openBox<UserAccountModel>('userData');
    userData.value = userDataBox.get("${user.uid}_accountData")!;
    await userDataBox.close();
  }
}
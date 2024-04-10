import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/utils/execute.dart';

class OnLogout extends Execute {
  OnLogout({super.instance = 'OnLogout'}) {
    execute();
  }

  @override
  execute() async {
    await executeWithCatchError(super.instance);
  }

  @override
  executeWithCatchError(String instance) async {
    logYellow("logging out...");
    await FirebaseAuth.instance.signOut();
    final lastUIDBox = await Hive.openBox<String>('lastUID');
    await lastUIDBox.put("uid", "");
    await lastUIDBox.close();
  }
}
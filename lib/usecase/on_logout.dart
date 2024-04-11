import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newspace/components/show_snackbar.dart';
import 'package:newspace/main.dart';
import 'package:newspace/utils/execute.dart';
import 'package:newspace/views/entry/entry_view.dart';

class OnLogout extends Execute {
  OnLogout({super.instance = 'OnLogout'});

  @override
  execute() async {
    ShowSnackBar(
      title: "Logging Out",
      message: "Please wait while we are saving your account data", 
      duration: const Duration(
        seconds: 55,
      )
    );
    logYellow("logging out...");
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=> EntryView());
  }
}
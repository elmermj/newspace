import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newspace/adapters/user_account_model_adapter.dart';
import 'package:newspace/firebase_options.dart';
import 'package:newspace/models/user_account_model.dart';
import 'package:newspace/usecase/update_lastUID.dart';
import 'package:newspace/utils/color_schemes.dart';
// import 'package:newspace/utils/object_box.dart';
import 'package:newspace/views/entry/entry_view.dart';
import 'package:newspace/views/home/home_view.dart';
import 'package:newspace/views/welcome/welcome_view.dart';

void logRed(String msg) {
  debugPrint('\x1B[31m$msg\x1B[0m');
}

void logGreen(String msg) {
  debugPrint('\x1B[32m$msg\x1B[0m');
}

void logYellow(String msg) {
  debugPrint('\x1B[33m$msg\x1B[0m');
}

void logCyan(String msg) {
  debugPrint('\x1B[36m$msg\x1B[0m');
}

void logPink(String msg){
  debugPrint('\x1B[35m$msg\x1B[0m');
}

// late ObjectBox objectbox;

Rx<UserAccountModel> userData = UserAccountModel().obs;
RxString deviceToken = ''.obs;
RxString lastUID = ''.obs;
RxBool isLogin = false.obs;
RxBool internetConnection = true.obs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initLocalData();

  var user = await FirebaseAuth.instance.currentUser?.getIdToken().timeout(
    const Duration(seconds: 55),
    onTimeout: () async {
      internetConnection.value = false;
      var lastUIDBox = await Hive.openBox<String>('lastUID');
      lastUID.value = lastUIDBox.get('uid')!;
      await lastUIDBox.close();
      return;
    }
  );

  logYellow('User ID token: $user');

  if(user!= null){

    final userID = FirebaseAuth.instance.currentUser!.uid;
    userData.value = Hive.box<UserAccountModel>('userData').get("${userID}_accountData")!;
    logGreen("SUCCESS RETRIEVING DATA FROM LOCAL STORAGE");
    logGreen("msg: ${userData.value.name}");
    logGreen("DEVICE TOKEN : ${userData.value.deviceToken}");
    UpdateLastUID(id: userID);
    isLogin.value = true;

  } else if(user==null && internetConnection.value == false && lastUID.value != ''){

    userData.value = Hive.box<UserAccountModel>('userData').get("${lastUID.value}_accountData")!;
    logGreen("SUCCESS RETRIEVING DATA FROM LOCAL STORAGE");
    logGreen("msg: ${userData.value.name}");
    logGreen("DEVICE TOKEN : ${userData.value.deviceToken}");
    isLogin.value = true;

  } else{

    isLogin.value = false;

  }

  // Check if the app is new or not
  var isNewAppBox = await Hive.openBox<bool>('isNewApp');
  var box = isNewAppBox.get('new', defaultValue: true);
  await isNewAppBox.close();
  bool isNewAppValue = box!;

  runApp(NewspaceApp(isNewApp: isNewAppValue,));
}

initLocalData() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAccountModelAdapter());
  await Hive.openBox<UserAccountModel>('userData');
}

class NewspaceApp extends StatelessWidget {
  const NewspaceApp({super.key, required this.isNewApp});
  final bool isNewApp;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.system,
      theme: ThemeData.from(colorScheme: lightScheme(), useMaterial3: true),
      darkTheme: ThemeData.from(colorScheme: darkScheme(), useMaterial3: true),
      home: isNewApp?
        WelcomeScreen()
        :
        isLogin.value?
          const HomeView()
          :
          EntryView()
    );
  }
}

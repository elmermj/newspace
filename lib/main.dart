import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:newspace/adapters/news_article_model_adapter.dart';
import 'package:newspace/adapters/timestamp_adapter.dart';
import 'package:newspace/adapters/user_account_model_adapter.dart';
import 'package:newspace/firebase_options.dart';
import 'package:newspace/models/user_account_model.dart';
import 'package:newspace/usecase/update_last_uid.dart';
import 'package:newspace/utils/appstate.dart';
import 'package:newspace/utils/color_schemes.dart';
// import 'package:newspace/utils/object_box.dart';
import 'package:newspace/views/entry/entry_view.dart';
import 'package:newspace/views/home/home_view.dart';
import 'package:newspace/views/welcome/welcome_view.dart';
import 'package:permission_handler/permission_handler.dart';

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

Rx<AppState> appState = AppState.idle.obs;
Rx<UserAccountModel> userData = UserAccountModel().obs;
RxString deviceToken = ''.obs;
RxString lastUID = ''.obs;
RxString selectedRegion = 'id'.obs;
RxBool isLogin = false.obs;
RxBool midProcess = false.obs;
RxBool internetConnection = true.obs;
RxBool permissionGranted = false.obs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await requestStoragePermission();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter(TimestampAdapter());
  Hive.registerAdapter(UserAccountModelAdapter());
  Hive.registerAdapter(NewsArticleModelAdapter());
  await Hive.openBox<UserAccountModel>('userData');
  // await initLocalData();

  deviceToken.value = await getNotificationToken();

  var userJWT = await FirebaseAuth.instance.currentUser?.getIdToken().timeout(
    const Duration(seconds: 55),
    onTimeout: () async {
      internetConnection.value = false;
      var lastUIDBox = await Hive.openBox<String>('lastUID');
      lastUID.value = lastUIDBox.get('uid')!;
      await lastUIDBox.close();
      return;
    }
  );

  logYellow('User JWT token: $userJWT');

  if(userJWT!= null){
    final userID = FirebaseAuth.instance.currentUser!.uid;
    userData.value = Hive.box<UserAccountModel>('userData').get("${userID}_accountData")!;
    logGreen("SUCCESS RETRIEVING DATA FROM LOCAL STORAGE");
    logGreen("msg: ${userData.value.name}");
    logGreen("DEVICE TOKEN : ${userData.value.deviceToken}");
    UpdateLastUID(id: userID);
    var lastUIDBox = await Hive.openBox<String>('lastUID');
    lastUID.value = lastUIDBox.get('uid')!;
    await lastUIDBox.close();
    isLogin.value = true;

  } else if(userJWT==null && internetConnection.value == false && lastUID.value != ''){

    userData.value = Hive.box<UserAccountModel>('userData').get("${lastUID.value}_accountData")!;
    logGreen("SUCCESS RETRIEVING DATA FROM LOCAL STORAGE");
    logGreen("msg: ${userData.value.name}");
    logGreen("DEVICE TOKEN : ${userData.value.deviceToken}");
    var lastUIDBox = await Hive.openBox<String>('lastUID');
    lastUID.value = lastUIDBox.get('uid')!;
    await lastUIDBox.close();
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

class NewspaceApp extends StatelessWidget {
  const NewspaceApp({super.key, required this.isNewApp});
  final bool isNewApp;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.system,
      theme: ThemeData.from(colorScheme: lightScheme(), useMaterial3: true),
      darkTheme: ThemeData.from(colorScheme: darkScheme(), useMaterial3: true),
      home: isNewApp?
        WelcomeScreen()
        :
        isLogin.value?
          HomeView()
          :
          EntryView()
    );
  }
}

getNotificationToken() async {
  String? token;
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  if(Platform.isAndroid){
    token = await FirebaseMessaging.instance.getToken();
  }
  if(Platform.isIOS){
    token = await FirebaseMessaging.instance.getAPNSToken();
  }

  logGreen("GOT NOTIFICATION TOKEN ::: $token");
  return token;
}

Future<void> requestStoragePermission() async {
  PermissionStatus status = await Permission.storage.request();
  if (status.isGranted) {
      // Permission is granted
      permissionGranted.value = true;
      logGreen("Storage permission granted.");
  } else {
      // Permission is denied or restricted
      permissionGranted.value = false;
      logRed("Storage permission denied.");
  }
}
import 'dart:io';

import 'package:get/get.dart';
import 'package:newspace/main.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController{


  clearImageCache() async {
    try {
      Directory? directory = await getExternalStorageDirectory();
      
      final folderPath = "${directory!.path}/images";
      
      final imageFiles = Directory(folderPath).listSync();
      
      for (var file in imageFiles) {
        file.deleteSync();
        logYellow("Deleted image: ${file.path}");
      }
    } on Exception catch (e) {
      logRed("ERROR DELETING CACHE ::: $e");
    }
  }
}
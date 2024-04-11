import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/views/entry/entry_view.dart';

class WelcomeController extends GetxController {
  RxInt index = 0.obs;

  @override
  onInit() async {
    super.onInit();
    var isNewAppBox = await Hive.openBox<bool>('isNewApp');
    await isNewAppBox.put('new', false);
    await isNewAppBox.close();
  }

  changePage(int pageIndex) async {
    index.value = pageIndex;
  }

  toEntryView() async {
    Get.offAll(()=> EntryView());
  }
}
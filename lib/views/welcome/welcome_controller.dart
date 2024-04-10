import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/views/entry/entry_view.dart';
import 'package:newspace/views/welcome/welcome_state.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();

  @override
  onInit() async {
    super.onInit();
    var isNewAppBox = await Hive.openBox<bool>('isNewApp');
    await isNewAppBox.put('new', false);
    await isNewAppBox.close();
  }

  changePage(int index) async {
    state.index.value = index;
  }

  toEntryView() async {
    Get.offAll(()=> EntryView());
  }

}
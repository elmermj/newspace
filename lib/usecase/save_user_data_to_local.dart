import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/models/user_account_model.dart';
import 'package:newspace/utils/execute.dart';

class SaveUserDataToLocal extends Execute{
  final String id;
  final Rx<UserAccountModel> userData;

  SaveUserDataToLocal({required this.id, required this.userData, super.instance = 'SaveUserDataToLocal'});
  
  @override
  execute() async {
    logYellow('saving to local...');
    final userDataBox = await Hive.openBox<UserAccountModel>('userData');
    await userDataBox.put("${id}_accountData", userData.value);

    final String name = userDataBox.get("${id}_accountData")!.name!;
    logYellow("SAVED NAME FROM ${id}_accountData ::: $name");
    await userDataBox.close();
  }
}
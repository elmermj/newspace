import 'package:hive/hive.dart';
import 'package:newspace/main.dart';
import 'package:newspace/utils/execute.dart';

class UpdateLastUID extends Execute {
  final String id;

  UpdateLastUID({required this.id, super.instance = 'UpdateLastUID'}) {
    execute();
  }

  @override
  execute() async {
    await executeWithCatchError(super.instance);
  }

  @override
  executeWithCatchError(String instance) async {
    logYellow("updating last uid...");
    final lastUIDBox = await Hive.openBox<String>('lastUID');
    await lastUIDBox.put("uid", id);
    await lastUIDBox.close();
  }
}
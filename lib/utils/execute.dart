import 'package:get/get.dart';
import 'package:newspace/components/show_snackbar.dart';
import 'package:newspace/main.dart';

abstract class Execute {
  final String instance;

  Execute({required this.instance});
  execute();

  executeWithCatchError(String instance) {
    try {
      execute();
    } catch (error) {
      catchError(instance, error);
    }
  }

  catchError(String instance, dynamic error) {
    logRed("Error in $instance: $error");
    if (Get.isSnackbarOpen) Get.back();
    ShowSnackBar(
      title: "Error",
      message: "$error",
      duration: const Duration(seconds: 3),
    );
  }
}

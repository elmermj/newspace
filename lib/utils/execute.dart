import 'package:get/get.dart';
import 'package:newspace/components/show_error_snackbar.dart';
import 'package:newspace/main.dart';
import 'package:newspace/utils/appstate.dart';

abstract class Execute {
  final String instance;

  Execute({required this.instance}){
    executeWithCatchError(instance);
  }

  execute();

  executeWithCatchError(String instance) async {
    try {
      midProcess.value = true;
      await execute();
      midProcess.value = false;
    } on Exception catch (error) {
      catchError(instance, error);
      midProcess.value = false;
    } finally {
      logRed("finally initiated");
      await closingSnackbar();
      appState.value = AppState.idle;
    }
  }

  catchError(String instance, dynamic error) {
    logRed("Error in $instance: $error");
    if (Get.isSnackbarOpen) Get.back();
    ShowErrorSnackBar(
      title: "Error",
      message: "$error",
      duration: const Duration(seconds: 3),
    );
  }

  closingSnackbar() async {

    if(Get.isSnackbarOpen && midProcess.value){
      ShowErrorSnackBar(
        title: "Cancelling",
        message: "Cancelling Process",
        duration: const Duration(milliseconds: 800),
      );
      midProcess.value = false;
      logRed("MID PROCRESS RUNNING ::: ${midProcess.value}");
    }else{
      logRed("Snackbar closed");
      midProcess.value = false;
    }
  }
  
}

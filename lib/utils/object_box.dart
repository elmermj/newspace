// import 'package:newspace/objectbox.g.dart';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';


// class ObjectBox {
//   late final Store store;
  
//   ObjectBox._create(this.store) {
//     // Add any additional setup code, e.g. build queries.
//   }

//   static Future<ObjectBox> create() async {
//     final docsDir = await getApplicationDocumentsDirectory();
//     final store = await openStore(directory: p.join(docsDir.path, "newspace_userdata"));
//     return ObjectBox._create(store);
//   }
// }
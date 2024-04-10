import 'package:objectbox/objectbox.dart';

@Entity()
class NewAppValidationModel {
  @Id()
  int id;

  bool? isOpened = false;

  NewAppValidationModel({
    required this.id,
    this.isOpened,
  });
}
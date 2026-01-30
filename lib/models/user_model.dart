import 'package:hive/hive.dart';
part 'user_model.g.dart';
@HiveType(typeId: 0)
class UserModel extends HiveObject{
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;

  UserModel({required this.image, required this.name});
}
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String surname;
  @HiveField(2)
  final String imageAsset;
  @HiveField(3)
  final int score;
  @HiveField(4)
  final String joinDate;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final String email;

  UserModel({
    required this.name,
    required this.surname,
    required this.imageAsset,
    required this.score,
    required this.joinDate,
    required this.address,
    required this.email,
  });
}

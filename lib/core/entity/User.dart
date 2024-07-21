import 'package:gest_life/core/enum/TypeUser.dart';

class CurrentUser {
  dynamic id;
  late String name;
  late String email;
  late TypeUser? typeUser;
  late String? password;
  late DateTime? creationTime;
  late String? imagePath;

  CurrentUser({
    this.id,
    required this.name,
    required this.email,
    this.typeUser,
    this.password,
    this.creationTime,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'typeUser': typeUser,
      'creationTime': creationTime,
      'imagePath': imagePath,
    };
  }

  static CurrentUser fromJson(Map<String, dynamic> json) => CurrentUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        typeUser: json['typeUser'],
        creationTime: json['creationTime'],
        imagePath: json['imagePath'],
      );
}

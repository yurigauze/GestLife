import 'package:gest_life/core/entity/User.dart';
import 'package:gest_life/core/enum/TypeUser.dart';

class Doctor extends CurrentUser {
  Doctor({
    required String name,
    required String email,
    required this.crm,
    this.expertise,
    String? id,
    TypeUser? typeUser,
    String? password,
    DateTime? creationTime,
    String? imagePath,
  }) : super(
          id: id,
          name: name,
          email: email,
          typeUser: typeUser,
          password: password,
          creationTime: creationTime,
          imagePath: imagePath,
        );

  // Named constructor that allows initialization without expertise
  Doctor.withoutExpertise({
    required String name,
    required String email,
    required String crm,
    String? id,
    TypeUser? typeUser,
    String? password,
    DateTime? creationTime,
    String? imagePath,
  }) : this(
          name: name,
          email: email,
          crm: crm,
          id: id,
          typeUser: typeUser,
          password: password,
          creationTime: creationTime,
          imagePath: imagePath,
        );

  late String crm;
  String? expertise;

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json.addAll({
      'crm': crm,
      'expertise': expertise,
    });
    return json;
  }

  static Doctor fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      typeUser: json['typeUser'],
      creationTime: DateTime.tryParse(json['creationTime'] ?? ''),
      imagePath: json['imagePath'],
      crm: json['crm'],
      expertise: json['expertise'],
    );
  }
}

import 'package:gest_life/core/entity/Doctor.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/validator/DoctorValidador.dart';

class DoctorService {
  final DoctorValidator _validator = DoctorValidator();

  void createDoctor(String name, String email, String crm, TypeUser typeUser) {
    try {
      _validator.validateCrm(crm);
      _validator.validateTypeUser(typeUser);

      var newDoctor =
          Doctor(name: name, email: email, crm: crm, typeUser: typeUser);
    } catch (e) {
      print("Validation error: ${e.toString()}");
    }
  }
}

import 'package:gest_life/core/entity/Doctor.dart';
import 'package:gest_life/core/entity/User.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/validator/DoctorValidador.dart';

class DoctorService {
  final DoctorValidator _validator = DoctorValidator();

  Doctor createDoctor(CurrentUser user, TypeUser typeType, String crm) {
    DoctorValidator _validator = DoctorValidator();
    _validator.validateCrm(crm);
    _validator.validateTypeUser(typeType);
    return Doctor(
      name: user.name,
      email: user.email,
      crm: crm,
      typeUser: typeType,
      password: user.password,
      imagePath: user.imagePath,
      creationTime: user.creationTime,
    );
  }
}

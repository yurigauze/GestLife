import 'package:gest_life/core/entity/Doctor.dart';
import 'package:gest_life/core/entity/User.dart';
import 'package:gest_life/core/enum/TypeUser.dart';
import 'package:gest_life/core/validator/DoctorValidador.dart';

class DoctorService {
  final DoctorValidator _validator = DoctorValidator();

  Doctor createDoctor(CurrentUser user, TypeUser typeType, String crm) {
    DoctorValidator _validator = DoctorValidator();

    // Validate the input data first
    _validator.validateCrm(crm);
    _validator.validateTypeUser(typeType);

    // If validations pass, create and return the Doctor
    return Doctor(
      name: user.name,
      email: user.email,
      crm: crm,
      typeUser: typeType,
      password: user
          .password, // Ensure that Doctor class has a password field if needed
      imagePath: user.imagePath,
      creationTime: user
          .creationTime, // This field must be handled if it's in CurrentUser
    );
  }
}

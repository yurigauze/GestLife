enum TypeUser {
  ADMIN,
  DOCTOR,
  PACIENT,
}

extension TypeUserExtension on TypeUser {
  String get name {
    switch (this) {
      case TypeUser.ADMIN:
        return "Administrador";
      case TypeUser.DOCTOR:
        return 'Médico';
      case TypeUser.PACIENT:
        return 'Paciente';
    }
  }
}

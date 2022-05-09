class RegistrationData {

  String? email;
  String? password;
  String? repeatedPassword;
  String? bio;
  int? birthdayTimestamp;
  String? name;
  GenderPreference? friendGenderPreference;
  Gender? gender;
}

enum Gender {
  male, female, both
}

enum GenderPreference {
  male, female, both
}
class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
  );
}

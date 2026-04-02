class RegisterRequestModel {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username.trim(),
      'email': email.trim(),
      'password': password,
      'confirmpassword': confirmPassword,
    };
  }
}

class LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email.trim(),
      'password': password,
    };
  }
}

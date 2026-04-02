class AuthUserModel {
  final String id;
  final String username;
  final String email;
  final String role;
  final bool isOnline;
  final String profilePicture;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AuthUserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.isOnline,
    required this.profilePicture,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: (json['_id'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      role: (json['role'] ?? '').toString(),
      isOnline: json['isOnline'] == true,
      profilePicture: (json['profilePicture'] ?? '').toString(),
      createdAt: _tryParseDate(json['createdAt']),
      updatedAt: _tryParseDate(json['updatedAt']),
    );
  }

  static DateTime? _tryParseDate(dynamic value) {
    if (value == null) return null;
    return DateTime.tryParse(value.toString());
  }
}

class RegisterResponseModel {
  final String message;
  final AuthUserModel? newUser;

  const RegisterResponseModel({
    required this.message,
    required this.newUser,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: (json['message'] ?? '').toString(),
      newUser: json['newUser'] is Map<String, dynamic>
          ? AuthUserModel.fromJson(json['newUser'] as Map<String, dynamic>)
          : null,
    );
  }
}

class LoginResponseModel {
  final String message;
  final String? token;
  final AuthUserModel? user;

  const LoginResponseModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final dataMap = data is Map<String, dynamic> ? data : null;

    final userJson = json['user'] ?? dataMap?['user'] ?? json['newUser'];

    return LoginResponseModel(
      message: (json['message'] ?? '').toString(),
      token: (json['token'] ?? dataMap?['token'])?.toString(),
      user: userJson is Map<String, dynamic>
          ? AuthUserModel.fromJson(userJson)
          : null,
    );
  }
}

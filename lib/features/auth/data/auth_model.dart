class AuthModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? accessToken;
  String? refreshToken;
  String? expiresAtUtc;

  AuthModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.accessToken,
    this.refreshToken,
    this.expiresAtUtc,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresAtUtc: json['expiresAtUtc'],
    );
  }
}

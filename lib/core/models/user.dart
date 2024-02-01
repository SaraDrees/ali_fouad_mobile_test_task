import 'dart:convert';

List<User> userFromJson(List str) => List<User>.from(str.map((x) => User.fromJson(x)));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? countryCode;
  String? passwordConfirm;
  String? currentPassword;
  String? token;
  DateTime? tokenExpiry;

  User(
      {
      this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.countryCode,
      this.passwordConfirm,
      this.currentPassword,
      this.token,
      this.tokenExpiry
      });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    countryCode = json['country_code'];
    passwordConfirm = json['password_confirm'];
    token = json['token'];
    tokenExpiry = DateTime.tryParse(json['token_expiry']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['country_code'] = countryCode;
    data['password_confirm'] = passwordConfirm;
    data['current_password'] = currentPassword;
    data.removeWhere((key, value) => value == null);
    return data;
  }
  
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['country_code'] = countryCode;
    data['password_confirm'] = passwordConfirm;
    data['current_password'] = currentPassword;
    data['token'] = token;
    data['token_expiry'] = tokenExpiry?.toIso8601String();
    data.removeWhere((key, value) => value == null);
    return data;
  }
  factory User.copyWith({required User user}) => User(
    id: user.id,
    name: user.name,
    email: user.email,
    password: user.password,
    passwordConfirm: user.passwordConfirm,
    phone: user.phone,
    countryCode: user.countryCode,
    currentPassword: user.currentPassword,
    token: user.token,
    tokenExpiry: user.tokenExpiry
  );
}
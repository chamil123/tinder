class UserModel {
  late String username;
  late String email;
  late String token;

  UserModel(
    this.username,
    this.email,
    this.token,
  );

  UserModel.fromJson(map) {
    username = map['username'];
    email = map['email'];
    token = map['token'];
  }
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'token': token,
    };
  }
}

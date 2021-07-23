class User {
  final bool success;
  final int requestCode;
  final String error;
  final String token;


  User(this.success, this.requestCode, this.error, this.token) ;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["success"] as bool,
      json["resquestCode"] as int,
      json["error"] as String,
      json['token'] as String
    );
  }
}
class User {
  int? id;
  String? username;
  String? password;

  User({this.id, this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = {'username': username, 'password': password};
    if (id != null) map['id'] = '$id';
    return map;
  }
}

class UserData {
  final String id;
  final String full_name;
  final String email;
  final String nim;
  final String? picture;

  UserData({
    required this.id,
    required this.full_name,
    required this.email,
    required this.nim,
    this.picture,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      full_name: json['full_name'],
      email: json['email'],
      nim: json['nim'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': full_name,
      'email': email,
      'nim': nim,
    };
  }
}

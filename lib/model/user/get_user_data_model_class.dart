class UsersData {
  final String id;
  final String username;
  final String email;
  final String name;
  final String avatar;
  final String created;

  UsersData({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.avatar,
    required this.created
  });

  factory UsersData.fromJson(Map<String, dynamic> json) {
    return UsersData(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      created: json['created']

    );
  }
}

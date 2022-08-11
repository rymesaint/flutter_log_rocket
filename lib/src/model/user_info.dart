class UserInfo {
  String? name;
  String? email;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

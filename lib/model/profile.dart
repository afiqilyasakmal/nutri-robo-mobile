class Profile {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String role;

  Profile({
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    // DateTime res;
    // try {
    //   res = DateTime.parse(json['bod']);
    // } catch (e) {
    //   res = DateTime.now();
    // }
    return Profile(
        username: json['username'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        role: json['role']);
  }
}

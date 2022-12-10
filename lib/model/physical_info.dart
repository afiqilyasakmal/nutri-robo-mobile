class Profile {
  final String username;
  final String email;

  final DateTime bod;
  final String bio;

  Profile({
    required this.username,
    required this.email,
    required this.bod,
    required this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        username: json['username'],
        email: json['email'],
        bod: json['bod'],
        bio: json['bio']);
  }
}

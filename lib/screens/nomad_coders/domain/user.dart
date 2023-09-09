class User {
  final String name;
  final String nickName;
  final String url;
  final String bio;
  final String profileUrl;
  final List<String> followers;

  User({
    required this.name,
    required this.nickName,
    required this.url,
    required this.bio,
    required this.profileUrl,
    required this.followers,
  });
}

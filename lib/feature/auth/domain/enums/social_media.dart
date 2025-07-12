enum SocialMediaAuthentication {
  facebook(id: 1, name: 'Facebook'),
  google(id: 2, name: 'Google'),
  apple(id: 3, name: 'Apple'),
  twitter(id: 4, name: 'Twitter');

  const SocialMediaAuthentication({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  static SocialMediaAuthentication fromId(int value) {
    return values.firstWhere((element) => element.id == value);
  }
}

class User {
  final String nameSurname;
  final String email;
  final String userName;
  final String password;
  final String passwordConfirm;
  final List<String> addAllergy;
  final List<String> addFavoriteCategories;

  User({
    required this.nameSurname,
    required this.email,
    required this.userName,
    required this.password,
    required this.passwordConfirm,
    this.addAllergy = const [],
    this.addFavoriteCategories = const [],
  });
}

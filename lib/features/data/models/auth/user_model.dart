import '../../../../core/utils/resources/strings_manager.dart';

class UserModel {
  final String email;
  final String? password;
  String? image;
  String? name;

  UserModel({
    required this.email,
    this.password,
    this.image,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json[AppStrings.firebaseEmail] ?? '',
      name: json[AppStrings.firebaseName],
      password: json[AppStrings.password],
      image: json[AppStrings.photoUrl],
    );
  }
}

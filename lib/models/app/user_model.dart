class UserModel {
  final String? image;
  final String name;
  final String email;
  final String phoneNumber;

  UserModel({
    this.image,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: json['image'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['mobile'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}

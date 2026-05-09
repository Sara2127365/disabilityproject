class UserModel {
  final String email;
  final String name;
  final String phone;
  final String location;
  final String blood;

  UserModel({required this.email, required this.name, required this.phone, required this.location, required this.blood});

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name,'phone':phone,'location':location,'blood':blood};
  }
}

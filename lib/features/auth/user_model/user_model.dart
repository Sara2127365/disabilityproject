class UserModel {
  final String email;
  final String name;
  final String phone;
  final String location;
  final String blood;
  final String image;
  final int donations;
  final int points;
  final int livesSaved;
  final bool isAvailable;

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.location,
    required this.blood,
    required this.image,
    required this.donations,
    required this.points,
    required this.livesSaved,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'location': location,
      'blood': blood,
      'image': image,
      'donations': donations,
      'points': points,
      'livesSaved': livesSaved,
      'isAvailable': isAvailable,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      location: json['location'],
      blood: json['blood'],
      image: json['image'],
      donations: json['donations'],
      points: json['points'],
      livesSaved: json['livesSaved'],
      isAvailable: json['isAvailable'],
    );
  }

  UserModel copyWith({
    String? email,
    String? name,
    String? image,
    String? phone,
    String? location,
    String? blood,
    bool? isAvailable,
    int? donations,
    int? points,
    int? livesSaved,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      blood: blood ?? this.blood,
      image: image ?? this.image,
      donations: donations ?? this.donations,
      points: points ?? this.points,
      livesSaved: livesSaved ?? this.livesSaved,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}

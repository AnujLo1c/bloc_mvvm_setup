import 'package:firebase_auth/firebase_auth.dart';

class GoogleUserModel {
  final String uid;
  final String name;
  final String email;

  GoogleUserModel({
    required this.uid,
    required this.name,
    required this.email,

  });

  factory GoogleUserModel.fromFirebaseUser(User user) {
    return GoogleUserModel(
      uid: user.uid,
      name: user.displayName ?? "No Name",
      email: user.email ?? "No Email",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }


  factory GoogleUserModel.fromMap(Map<String, dynamic> map) {
    return GoogleUserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

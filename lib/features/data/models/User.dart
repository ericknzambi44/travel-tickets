import 'package:dream_tickets/features/domain/entities/users.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email});

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(id: json['id'], email: json['email']);
  }
  Map<String, dynamic> toJSON() {
    return ({'id': id, 'email': email});
  }

  UserEntity toEntity() {
    return UserEntity(id: id, email: email);
  }
}

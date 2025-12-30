import 'package:dream_tickets/features/domain/entities/profil.dart';

class ProfilModel extends ProfilEntity {
  ProfilModel({
    required super.id,
    required super.name,
    required super.pictureUrl,
    required super.adresse,
  });
  factory ProfilModel.fromJson(Map<String, dynamic> json) {
    return ProfilModel(
      id: json['id'] as String,
      name: json['name'] as String,
      pictureUrl: json['picture_url'] as String,
      adresse: json['adresse'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'picture_url': pictureUrl, 'adresse': adresse};
  }

  ProfilEntity toEntity() {
    return ProfilEntity(
      id: id,
      name: name,
      pictureUrl: pictureUrl,
      adresse: adresse,
    );
  }
}

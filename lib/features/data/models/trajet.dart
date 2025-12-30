import 'package:dream_tickets/features/domain/entities/trajet.dart';

class TrajetModel extends TrajetEntity {
  TrajetModel({
    required super.id,
    required super.depart,
    required super.arriver,
    required super.prix,
    required super.heureDepart,
  });

  factory TrajetModel.fromJson(Map<String, dynamic> json) {
    return TrajetModel(
      id: json['id'] as int,
      depart: json['depart'] as String,
      arriver: json['arrivee'] as String,
      prix: (json['prix'] as num).toDouble(),
      heureDepart: json['heure_depart'] as DateTime,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'depart': depart,
      'arrivee': arriver,
      'prix': prix,
      'heure_depart': heureDepart,
    };
  }

  TrajetEntity toEntity() {
    return TrajetEntity(
      id: id,
      depart: depart,
      arriver: arriver,
      prix: prix,
      heureDepart: heureDepart,
    );
  }
}

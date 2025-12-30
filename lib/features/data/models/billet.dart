import 'package:dream_tickets/features/domain/entities/billet.dart';

class TicketModel extends TicketEntity {
  TicketModel({
    required super.id,
    required super.profilId,
    required super.trajectId,
    required super.namePassager,
    required super.dateAchat,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as int,
      profilId: json['profil_id'] as String,
      trajectId: json['trajet_id'] as int,
      namePassager: json['nom'] as String,
      dateAchat: DateTime.parse(json['date_achat'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profil_id': profilId,
      'trajet_id': trajectId,
      'nom': namePassager,
      'date_achat': dateAchat.toIso8601String(),
    };
  }

  TicketEntity toEntity() {
    return TicketEntity(
      id: id,
      profilId: profilId,
      trajectId: trajectId,
      namePassager: namePassager,
      dateAchat: dateAchat,
    );
  }
}

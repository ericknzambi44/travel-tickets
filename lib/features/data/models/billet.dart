import 'package:dream_tickets/features/domain/entities/billet.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TicketModel extends TicketEntity {
  TicketModel({
    required super.id,
    required super.profilId,
    required super.trajectId,
    required super.namePassager,
    required super.date,
    required super.dateVoyage,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] as int,
      profilId: json['profil_id'] as String,
      trajectId: json['trajet_id'] as int,
      namePassager: json['nom'] as String,
      date: DateTime.parse(json['date_achat'] as String),
      dateVoyage: json['date_voyage'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profil_id': profilId,
      'trajet_id': trajectId,
      'nom': namePassager,
      'date_achat': date.toIso8601String(),
    };
  }

  TicketEntity toEntity() {
    return TicketEntity(
      id: id,
      profilId: profilId,
      trajectId: trajectId,
      namePassager: namePassager,
      date: date,
      dateVoyage: dateVoyage,
    );
  }
}

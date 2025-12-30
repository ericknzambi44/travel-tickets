import 'package:dream_tickets/features/domain/entities/paiement.dart';

class PaiementModel extends PaiementEntity {
  PaiementModel({
    required super.id,
    required super.ticketID,
    required super.amount,
    required super.datePaiement,
  });

  factory PaiementModel.fromJson(Map<String, dynamic> json) {
    return PaiementModel(
      id: json['id'] as int,
      ticketID: json['ticketID'] as String,
      amount: (json['amount'] as num).toDouble(),
      datePaiement: DateTime.parse(json['datePaiement'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticketID': ticketID,
      'amount': amount,
      'datePaiement': datePaiement.toIso8601String(),
    };
  }

  PaiementEntity toEntity() {
    return PaiementEntity(
      id: id,
      ticketID: ticketID,
      amount: amount,
      datePaiement: datePaiement,
    );
  }
}

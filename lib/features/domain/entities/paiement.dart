class PaiementEntity {
  final String id;
  final String ticketID;
  final double amount;
  final DateTime datePaiement;

  PaiementEntity({
    required this.id,
    required this.ticketID,
    required this.amount,
    required this.datePaiement,
  });
}

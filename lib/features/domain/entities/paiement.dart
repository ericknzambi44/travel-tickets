class PaiementEntity {
  final int id;
  final int ticketID;
  final double amount;
  final DateTime datePaiement;

  PaiementEntity({
    required this.id,
    required this.ticketID,
    required this.amount,
    required this.datePaiement,
  });
  @override
  List<Object?> get props => [id, ticketID, amount, datePaiement];
}

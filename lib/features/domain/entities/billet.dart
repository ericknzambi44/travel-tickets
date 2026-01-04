class TicketEntity {
  final int id;
  final String profilId;
  final int trajectId;
  final String namePassager;
  final DateTime date;
  final DateTime dateVoyage;

  TicketEntity({
    required this.id,
    required this.profilId,
    required this.trajectId,
    required this.namePassager,
    required this.date,
    required this.dateVoyage,
  });
}

class TicketEntity {
  final int id;
  final String profilId;
  final int trajectId;
  final String namePassager;
  final DateTime dateAchat;

  TicketEntity({
    required this.id,
    required this.profilId,
    required this.trajectId,
    required this.namePassager,
    required this.dateAchat,
  });
}

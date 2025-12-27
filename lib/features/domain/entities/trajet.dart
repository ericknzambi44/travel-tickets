class TrajetEntity {
  final int id;
  final String depart;
  final String arriver;
  final double prix;
  final DateTime heureDepart;

  TrajetEntity({
    required this.id,
    required this.depart,
    required this.arriver,
    required this.prix,
    required this.heureDepart,
  });
}

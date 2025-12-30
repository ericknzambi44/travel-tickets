class ProfilEntity {
  final String id;
  final String name;
  final String pictureUrl;
  final String adresse;

  ProfilEntity({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.adresse,
  });

  @override
  List<Object?> get props => [name, pictureUrl, adresse];
}

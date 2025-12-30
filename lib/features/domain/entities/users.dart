class UserEntity {
  final String id;
  final String email;

  UserEntity({required this.id, required this.email});
  @override
  List<Object?> get props => [id, email];
}

import 'package:dartz/dartz.dart';
import 'package:dream_tickets/features/domain/entities/profil.dart';
import 'package:dream_tickets/features/domain/repositories/profil_repository.dart';
import 'package:dream_tickets/core/error/failures.dart';

class UpdateProfileUsecase {
  final ProfilRepository repository;

  UpdateProfileUsecase(this.repository);

  Future<Either<Failure, ProfilEntity>> call({
    required String email,
    required String nom,
    required String adresse,
  }) {
    return repository.updateProfil(nom: nom, email: email, adresse: adresse);
  }
}

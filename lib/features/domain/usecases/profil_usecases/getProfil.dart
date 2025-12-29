import 'package:dartz/dartz.dart';
import 'package:dream_tickets/features/domain/entities/profil.dart';
import 'package:dream_tickets/features/domain/repositories/profil_repository.dart';
import 'package:dream_tickets/core/error/failures.dart';

class GetProfilUseCase {
  final ProfilRepository repository;

  GetProfilUseCase(this.repository);

  Future<Either<Failure, ProfilEntity>> call() async {
    return await repository.getProfil();
  }
}

import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/repositories/profil_repository.dart';

class DeleteProfileUseCase {
  final ProfilRepository repository;

  DeleteProfileUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.deleteProfil();
  }
}

import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';
import 'package:dream_tickets/features/domain/repositories/paiement_repository.dart';

class VerifierStatusPaiementUsecase {
  final PaiementRepository repository;

  VerifierStatusPaiementUsecase(this.repository);

  Future<Either<Failure, PaiementEntity>> call(String paiementId) async {
    return await repository.verifierStatutPaiement(paiementId);
  }
}

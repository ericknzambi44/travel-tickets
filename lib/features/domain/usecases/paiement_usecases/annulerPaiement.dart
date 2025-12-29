import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/repositories/paiement_repository.dart';

abstract class AnnulerPaiementUsecase {
  Future<Either<Failure, void>> call(String paiementID);
}

class AnnulerPaiementUsecaseImpl implements AnnulerPaiementUsecase {
  final PaiementRepository repository;

  AnnulerPaiementUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String paiementID) async {
    return await repository.annulerPaiement(paiementID);
  }
}

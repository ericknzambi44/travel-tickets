import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';

abstract class PaiementRepository {
  Future<Either<Failure, PaiementEntity>> effectuerPaiement({
    required int ticketId,
    required double montant,
    required String numeroTelephone,
    required String operateur,
  });

  Future<Either<Failure, PaiementEntity>> verifierStatutPaiement(
    int paiementId,
  );

  Future<Either<Failure, bool>> annulerPaiement(int paiementId);
}

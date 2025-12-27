import 'package:dartz/dartz.dart';
import 'package:dream_tickets/core/error/failures.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';

abstract class PaiementRepository {
  Future<Either<Failure, PaiementEntity>> effectuerPaiement({
    required double montant,
    required String numeroTelephone,
    required String operateur, // 'orange', 'mtn', 'moov', e
  });

  Future<Either<Failure, PaiementEntity>> verifierStatutPaiement(
    String paiementId,
  );

  Future<Either<Failure, bool>> annulerPaiement(String paiementId);
}

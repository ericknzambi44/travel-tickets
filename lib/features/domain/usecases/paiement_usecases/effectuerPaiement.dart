import 'package:dartz/dartz.dart';
import 'package:dream_tickets/features/domain/entities/paiement.dart';

import '../../repositories/paiement_repository.dart';
import '../../../../core/error/failures.dart';

class EffectuerPaiement {
  final PaiementRepository repository;

  EffectuerPaiement(this.repository);

  Future<Either<Failure, PaiementEntity>> call({
    required double montant,
    required String numeroTelephone,
    required String operateur,
  }) {
    return repository.effectuerPaiement(
      montant: montant,
      numeroTelephone: numeroTelephone,
      operateur: operateur,
    );
  }
}
